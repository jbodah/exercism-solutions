class Words

  module.exports = Words

  constructor: (phrase) ->
    word_count = {}
    words = phrase.replace(/[^\w\s\d]+/g, '').replace(/\s+/g, ' ').split(' ')
    for word in words
      word = word.toLowerCase()
      word_count[word] ?= 0
      word_count[word] += 1
    @count = word_count