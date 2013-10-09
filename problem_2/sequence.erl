-module(sequence).
-export([main/1,fib/1]).

main(MaxSum) ->
  io:format("Starting Fibonacci sequences: ~p~n", [time()]),
  Sequence  = fib(MaxSum),
  io:format("Finished! ~p~n", [time()]),
  io:format("Sequence: ~p~n", [Sequence]).

fib(N) ->
  fib(N,0,1,[0]).
fib(0, Current, Next, FibList) ->
  lists:reverse(FibList);
fib(N, Current, Next, FibList) ->
  fib(N - 1, Next, Current + Next, [Next | FibList]).
