params.seq = "$baseDir/data/BB11*.tfa" 
seq_ch = Channel.fromPath(params.seq)

process aling {
	
	input:  file 'sequences.fasta' from seq_ch
	output: file 'out.aln' into aln_ch
	
	"""
	t_coffee -in sequences.fasta -outfile out.aln 
	""" 
}

process merge {
	input: file 'out*.aln' from aln_ch.toList()
	output: file 'big.aln' into big_ch
	
	"""
	t_coffee -profile out*.aln -outfile big.aln -output phy
	"""
	
}

process make_tree { 
	publishDir 'results'

	input: file(aln) from big_ch
	output: file('RAxML_bestTree.demo')
	
	"""
	raxml -T 2 -m PROTGAMMALG -s $aln -n demo  
	"""

}




