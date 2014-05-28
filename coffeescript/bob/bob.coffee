class Bob

  module.exports = Bob

  hey: (input) -> switch
                  when input.trim().length == 0   then "Fine. Be that way!"                  
                  when !input.match ///[a-z]+///  then "Woah, chill out!"
                  when input.match ///\?$///      then "Sure."
                  else "Whatever."
                    