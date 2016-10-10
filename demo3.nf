params.gene_id = 'Sec23a'
params.annot = 'data/annot-mouse.gtf'

annotations = Channel.fromPath(params.annot)

process count {
  echo true
  
  input: 
  val gene_id from params.gene_id
  file 'annot.gft' from annotations

  """
  grep ${gene_id} annot.gft | awk '\$3=="transcript"' | wc -l
  """
}