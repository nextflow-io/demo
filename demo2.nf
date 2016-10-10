params.gene_id = 'Sec23a'

annotations = Channel.fromPath('data/annot-mouse.gtf')

process count {
  echo true
  
  input: 
  val gene_id from params.gene_id
  file 'annot.gft' from annotations

  """
  grep ${gene_id} annot.gft | awk '\$3=="transcript"' | wc -l
  """
}