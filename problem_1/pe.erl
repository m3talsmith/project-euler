-module(pe).
-export([main/0, multiply_by_upto/3, has_remainder/1]).

main() -> multiply_by_3_and_5_upto(1000).

multiply_by_3_and_5_upto(Upto) ->
  M3 = multiply_by_upto(Upto, 3, []),
  M4 = multiply_by_upto(Upto, 5, []),
  Multiples = lists:usort(M3 ++ M4),
  io:format("Multiples up to ~p by 3's and 5's: ~p~n", [Upto, Multiples]),
  io:format("Totaling: ~p", [lists:sum(Multiples)]).

multiply_by_upto(0, _, Multiples) -> lists:reverse(Multiples);
multiply_by_upto(Next, By, Multiples) ->
  N = (Next / By),
  R = has_remainder(N),
  case R of
    true  -> multiply_by_upto(Next - 1, By, Multiples);
    false -> multiply_by_upto(Next - 1, By, [Next | Multiples])
  end.

%% Private
has_remainder(Number)         when is_integer(Number) -> false;
has_remainder({Remainder, _}) when Remainder > 0      -> true;
has_remainder({Remainder, _}) when Remainder < 1      -> false;

has_remainder(Number) when is_float(Number) ->
  FormattedFloat = lists:flatten(io_lib:format("~.1f", [Number])),
  has_remainder(re:split(FormattedFloat, "\\.", [{return, list}]));

has_remainder([_ | Decimal]) ->
  has_remainder(string:to_integer(lists:flatten(Decimal))).
