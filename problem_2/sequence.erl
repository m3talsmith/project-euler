-module(sequence).
-export([main/1, fib_even_upto/1]).

main(MaxCount) -> fib_even_upto(MaxCount).

fib_even_upto(0)    -> [0];
fib_even_upto(Upto) -> fib_even_upto(0, 1, Upto, [0]).

fib_even_upto(Current, Next, Upto, Sequence) when (Current + Next) > Upto ->
  io:format("Sequence generated: ~p~n", [lists:reverse(Sequence)]);
fib_even_upto(Current, Next, Upto, Sequence) when ((Current + Next) rem 2) =:= 1 ->
  N = Current + Next,
  fib_even_upto(Next, N, Upto, Sequence);
fib_even_upto(Current, Next, Upto, Sequence) ->
  N = Current + Next,
  fib_even_upto(Next, N, Upto, [N | Sequence]).
