%%%-------------------------------------------------------------------
%%% @author yg10
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. May 2019 22:44
%%%-------------------------------------------------------------------
-module(message).
-author("yg10").

-include("wsl.hrl").
-include("pb_client.hrl").
-include("pb_stream.hrl").

%% API
-export([out_msg/2, in_msg/2]).

-spec out_msg(Tag :: atom(), Msg :: term()) -> binary().
out_msg(Tag, Msg) ->
    io:format("out: ~p~n", [#'ProtobufClient.ClientMessage'{body = {Tag, Msg}}]),
    pb_client:encode_msg(#'ProtobufClient.ClientMessage'{body = {Tag, Msg}}, 'ProtobufClient.ClientMessage').

-spec in_msg(Tag :: atom(), Msg :: pb_stream:'ProtobufStream.StreamMessage'()) -> term().
in_msg(subscriptionResult, Msg) ->
%    io:format("in_msg: ~p~n", [Msg]),
    #'ProtobufStream.SubscriptionResult'{failed = Failed, status = Status, subscriptions = Subs} = Msg,
    io:format("Sub: ~p~n, fail: ~p~n ~p ~n", [Subs, Failed, Status]),
    {Subs, Failed, Status};

in_msg(marketUpdate, Msg) ->
    case Msg of
        #'ProtobufMarkets.MarketUpdateMessage'{market = M, 'Update' = {tradesUpdate, {'ProtobufMarkets.TradesUpdate', T}}} ->
            {_, Xchg, Pair, Mkt, _, _} = M,
            Market = #market{exchange_id = Xchg, pair_id = Pair, market_id = Mkt},
            #tlist{market = Market, trades = lists:map(fun(X) -> trades(X) end, T)}
    end.

trades(X) ->
    #'ProtobufMarkets.Trade'{
        price  = P,
        timestampNano = Ts,
        amount = Vol
    } = X,
    #trade{timestamp = Ts, price = P, vol = Vol}.

