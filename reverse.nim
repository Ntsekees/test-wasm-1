
proc reverse*(plaintext: var cstring, length: cint): void {.exportc.} =
  var i: cint = 0
  #return cast[int](plaintext[0])
  #plaintext[0] = '@'
  while i < (length / 2).cint:
    let value: char = plaintext[i];
    plaintext[i] = plaintext[length - i - 1];
    plaintext[length - i - 1] = value;
    i += 1
  return


