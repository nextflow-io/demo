annotations = Channel.fromPath('data/annot-mouse.gtf')

process count {
  echo true
  
  input: file 'annot.gft' from annotations

  """
  grep Sec23a annot.gft | awk '\$3=="transcript"' | wc -l
  """
}