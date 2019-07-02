%%%-------------------------------------------------------------------
%%% @author yg
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. May 2019 13:19
%%%-------------------------------------------------------------------
-module(demo).
-author("yg10").

-include("../include/wsl.hrl").
%% API
-export([get_creds/0,
    start/0,
    subscriptionResult/1,
    marketUpdate/1]).

-behavior(wsl).
%-spec get_creds() -> creds().

get_creds() ->
    {{api, "02902WOKNKEJN01DV18Z" },
    {secret, "UIO/BJfSyRyGN/zfPdag9AVVzWRHxQ4mYime6FSo" }}.

start() ->
    Pid = wsl:start_link([{?MODULE, ["markets:*:trades"]}]).

subscriptionResult(S) ->
    io:format("Suscribed: ~p~n", [S]).

marketUpdate(S) ->
    T = S#tlist.trades,
    io:format("~p~n", [S#tlist.market]),
    lists:foreach(fun(X) ->  io:format("~p~n", [X#trade{}]) end, T).
