params.gene_id = 'Sec23a'
params.annot = 'data/annot-mouse.gtf'

annotations = Channel.fromPath(params.annot)

process count {
  
  input: 
  val gene_id from params.gene_id
  file 'annot.gft' from annotations
  
  output: 
  file 'count.txt' into count_ch

  """
  echo -n ${gene_id}, > count.txt 
  grep ${gene_id} annot.gft | awk '\$3=="transcript"' | wc -l >> count.txt
  """
}

process aggregate {
  echo true
  
  input: 
  file c from count_ch.collectFile()
  
  """
  awk -F',' '{sum+=\$2} END{print sum;}' $c
  """
  
}