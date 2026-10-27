#let blocking-notice(
  gender: none,
  thesis-type: none,
  blocking-text: none,
  t: none,
) = {

  v(1fr)
  if blocking-text == none {
    (t.blocking-notice)(thesis-type: thesis-type, gender: gender)
  }
  else{
    text(blocking-text)
  }
  v(1fr)
}
