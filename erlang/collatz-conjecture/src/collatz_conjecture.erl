-module(collatz_conjecture).

-export([steps/1, test_version/0]).


steps(N) -> steps1(N, 0).

steps1(N, _Acc) when N < 1 -> {error, "Only positive numbers are allowed"};
steps1(1, Acc) -> Acc;
steps1(N, Acc) when N rem 2 == 0 -> steps1(round(N / 2), Acc + 1);
steps1(N, Acc) -> steps1(3 * N + 1, Acc + 1).

test_version() -> 2.
