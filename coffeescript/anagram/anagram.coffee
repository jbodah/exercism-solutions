class Anagram

  module.exports = Anagram

  constructor: (original) ->
    @original = original

  match: (candidates) ->
    candidate.toLowerCase() for candidate in candidates when isMatch candidate, @original

  isMatch = (first, second) ->
    first = first.toLowerCase()
    second = second.toLowerCase()
    sort(first) == sort(second) && first != second

  sort = (word) ->
    word.split('').sort().join('')