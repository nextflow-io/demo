params.seq = "$baseDir/data/BB11001.tfa" 
seq_ch = Channel.fromPath(params.seq)

process aling {
	
	input:  file 'sequences.fasta' from seq_ch
	output: file 'out.aln' into aln_ch
	
	"""
	t_coffee -in sequences.fasta -outfile out.aln -output phy
	""" 
}

process make_tree { 
	publishDir 'results'

	input: file(aln) from aln_ch
	output: file('RAxML_bestTree.demo')
	
	"""
	raxml -m PROTGAMMALG -s $aln -n demo  
	"""

}




