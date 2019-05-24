%%%-------------------------------------------------------------------
%%% @author yg
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. May 2019 03:02
%%%-------------------------------------------------------------------

-module(subscribe).
-author("yg").

%% API
-export([subscription/1, subs/1]).

-type prefix() :: markets | exchanges | pairs | assets.
-type subj() :: integer().
-type suffix() :: trades | summary | ohlc.
-type bsuffix() :: snapshots | deltas | spread.
-type sub() :: { prefix(),  subj(), suffix() } | {prefix(), subj(), book, bsuffix()}.

-spec subscription(sub()) -> string().
subscription(S) ->
    case S of
        {Pr, Num, Suff} ->
            atom_to_list(Pr) ++ ":" ++  integer_to_list(Num) ++ ":" ++ atom_to_list(Suff);
        {Pr, Num, book, S, BS} ->
            atom_to_list(Pr) ++ integer_to_list(Num) ++ "book" ++ atom_to_list(BS)

    end.

-spec subs([sub()]) -> [string()].
subs(S) ->
    lists:map(fun  subscribe:subscription/1, S).




