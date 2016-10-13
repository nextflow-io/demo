params.seq = "$baseDir/data/BB11001.tfa" 
seq_ch = Channel.fromPath(params.seq)

process aling {
	echo true
	input:  file 'sequences.fasta' from seq_ch
	
	"""
	t_coffee -in sequences.fasta  
	""" 
}

