-module(sequence).
-export(main/0).

main() ->
  io:format("Starting Fibonacci sequences~n"),
  StartTime = time(),
  MaxSum    = 4000000,
  Sequence  = fibonacci_sum(MaxSum),
  EndTime   = time(),
  TimeSpent = EndTime - StartTime
  io:format("Finished!~n"),
  io:format("Sequence: ~s~n", [Sequence]),
  io:format("Finished in ~s minutes~n", [TimeSpent]).

fibonacci_sum(0) ->
  0;
fibonacci_sum(N) when N =:= 1 or N =:= 2 ->
  1;
fibonacci_sum(N) when N rem 2 =:= 0 ->
  M = N / 2,
  fast_fibonacci(M) * (2 * fast_fibonacci(M + 1) - fast_fibonacci(M));
fibonacci_sum(N) when N rem 2 =:= 1 ->
  L = (N - 1) / 2,
  math:pow(fast_fibonacci(L + 1), 2) + math:pow(fast_fibonacci(L), 2).

fibonacci_sum(N) >= MaxSum ->
  N;
fibonacci_sum(N) < MaxSum ->
  fibonacci_sum(fast_fibonaci(N)).
