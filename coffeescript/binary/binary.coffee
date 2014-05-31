class Binary

  module.exports = Binary

  constructor: (binary) ->
    @binary = binary

  toDecimal: () ->
    val = 0
    for char, i in @binary
      return 0 unless char in ['0','1']
      val += char * 2 ** (@binary.length - i - 1)      
    val      
