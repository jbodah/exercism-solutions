class Binary

  module.exports = Binary

  constructor: (binary) ->
    @binary = binary

  toDecimal: () ->
    val = 0
    length = @binary.length
    for i in [0...length]
      char = @binary[i]
      return 0 unless char in ['0','1']
      val += char * 2 ** (length - i - 1)
    val      
