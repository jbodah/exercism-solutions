-module(accumulate).

-export([accumulate/2, test_version/0]).

accumulate(Fn, Ls) ->
  lists:map(Fn, Ls).

test_version() -> 1.
