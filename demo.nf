#!/usr/bin/env nextflow

params.seq = "$baseDir/data/BB11001.tfa"
params.out = "results" 
seq_ch = Channel.fromPath(params.seq)

process align {
  input: 
  file seq from seq_ch 
  output: 
  file '*.phy' into aln_ch
	
  """
  t_coffee -in $seq -output phy
  """
  
}

process makeTree {
	publishDir params.out, mode: 'copy' 
	
	input: 
	file aln from aln_ch 
	output:
	file 'RAxML_bestTree.*' 

	"""
	raxml -s $aln -m PROTGAMMALG -n $aln.baseName
	"""
	
}



workflow.onComplete {
  println workflow.success ? "Done! Check result files in the folder `${params.out}`" : 'Oops.. something went wrong'
}