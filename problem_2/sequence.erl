-module(sequence).
-export([main/0, fib_even_upto/1, sum/1]).

main() -> sum(fib_even_upto(4000000)).

fib_even_upto(0)    -> [0];
fib_even_upto(Upto) -> fib_even_upto(0, 1, Upto, [0]).

fib_even_upto(Current, Next, Upto, Sequence) when (Current + Next) > Upto ->
  io:format("Sequence generated: ~p~n", [lists:reverse(Sequence)]),
  lists:reverse(Sequence);
fib_even_upto(Current, Next, Upto, Sequence) when ((Current + Next) rem 2) =:= 1 ->
  N = Current + Next,
  fib_even_upto(Next, N, Upto, Sequence);
fib_even_upto(Current, Next, Upto, Sequence) ->
  N = Current + Next,
  fib_even_upto(Next, N, Upto, [N | Sequence]).

sum(Values) -> sum(Values, 0).

sum([], Total) ->
  io:format("List total: ~p~n", [Total]),
  Total;
sum([Value | Values], Total) ->
  sum(Values, Total + Value).
