
proc js_log*(str: cstring, len: uint): void {.importc.}
proc wa_input_size*(): uint {.importc.}
proc wa_input*(str: cstring): void {.importc.}
proc wa_output*(str: cstring, len: uint): void {.importc.}

proc reverse(plaintext: var cstring, length: cint): void =
  var i: cint = 0
  while i < (length / 2).cint:
    let value: char = plaintext[i];
    plaintext[i] = plaintext[length - i - 1];
    plaintext[length - i - 1] = value;
    i += 1
  return

proc wa_reverse*(): void {.exportc.} =
  let length = wa_input_size()
  var cs = newStringOfCap(length).cstring
  wa_input(cs)
  reverse(cs, length.cint)
  wa_output(cs, length)
  js_log(cs, length)
  return

