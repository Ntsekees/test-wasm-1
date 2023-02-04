
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
  # First, we ask Javascript to communicate the size of the input string:
  let length = wa_input_size()
  # Then we create a buffer of the appropriate capacity:
  var cs = newStringOfCap(length).cstring
  # Now we ask Javascript to write the input in the buffer:
  wa_input(cs)
  # Now that we have the input string, we can apply the reverse function on it:
  reverse(cs, length.cint)
  # Now, we tell Javascript to read the reversed string and save it to a safe place (so that it isn't lost to garbage collection):
  wa_output(cs, length)
  # This is inessential, but for the sake of demonstration, we also send the string we produced to Javascript's “console.log” function, for printing the string to the web console.
  js_log(cs, length)
  return

