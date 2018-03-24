-module(raindrops).

-export([convert/1, test_version/0]).

convert(Number) ->
  String = "",
  String2 = maybe_add_pling(Number, String),
  String3 = maybe_add_plang(Number, String2),
  String4 = maybe_add_plong(Number, String3),
  maybe_add_integer(Number, String4).

maybe_add_pling(Number, Acc) when Number rem 3 == 0 ->
  Acc ++ "Pling";
maybe_add_pling(_, Acc) ->
  Acc.

maybe_add_plang(Number, Acc) when Number rem 5 == 0 ->
  Acc ++ "Plang";
maybe_add_plang(_, Acc) ->
  Acc.

maybe_add_plong(Number, Acc) when Number rem 7 == 0 ->
  Acc ++ "Plong";
maybe_add_plong(_, Acc) ->
  Acc.

maybe_add_integer(Number, Acc) when length(Acc) == 0 ->
  integer_to_list(Number);
maybe_add_integer(_, Acc) ->
  Acc.

test_version() -> 1.
