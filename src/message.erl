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

%% API
-export([out_msg/2, in_msg/1]).

-spec out_msg(Tag :: atom(), Msg :: term()) -> binary().
out_msg(Tag, Msg) ->
    pb_client:encode_msg(#{body => {Tag, Msg}}, 'ProtobufClient.ClientMessage').

-spec in_msg(Msg :: pb_stream:'ProtobufStream.StreamMessage'()) -> term().
in_msg (Msg) ->
    Tags = [authenticationResult, subscriptionResult,  unsubscriptionResult,marketUpdate, pairUpdate, assetUpdate, indexUpdate],
    {Tag, M} = Msg,
    case Tag of subscriptionResult ->
        ok;
%    end,
    ok.

