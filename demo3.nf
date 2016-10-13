params.seq = "$baseDir/data/BB11001.tfa" 
seq_ch = Channel.fromPath(params.seq)

process aling {
	
	input:  file 'sequences.fasta' from seq_ch
	output: file 'out.aln' into aln_ch
	
	"""
	t_coffee -in sequences.fasta -outfile out.aln 
	""" 
}

aln_ch.println()




