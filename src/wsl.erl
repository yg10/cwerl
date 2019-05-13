-module(wsl).

-behaviour(websocket_client).

-include("../include/wsl.hrl").
-include("pb_client.hrl").
-include("pb_stream.hrl").
-define(URL, "wss://stream.cryptowat.ch").

%% API exports
-export([start_link/0,
        init/1,
        onconnect/2,
        ondisconnect/2,
        websocket_handle/3,
        websocket_info/3,
        websocket_terminate/3,
        subscribe/1,
        unsubscribe/1,
        stop/0]).

-callback get_creds() -> {{api, string()}, {secret, string()}}.

%%====================================================================
%% API functions
%%====================================================================


start_link() -> 
    crypto:start(),
    ssl:start(),
    websocket_client:start_link(?URL, ?MODULE, []).

subscribe(S) -> {ok, S}.
unsubscribe(S) -> {ok, S}.
stop() -> {ok}.

init([]) ->
        {reconnect, disconnected}.
    
onconnect(_WSReq, _State) ->
    authenticate(),
    {ok, authorizing}.

ondisconnect({remote, closed}, State) ->
    {reconnect, State}.

websocket_terminate(Reason, _ConnState, State) ->
    io:format("Websocket closed in state ~p with reason ~p~n", [State, Reason]),
    ok.

websocket_info(_A, _ConnState, State) ->
    {reply, {text, <<"erlang message received">>}, State}.

websocket_handle({binary,<<1>>}, _Conn, State) ->
     {ok, State};

websocket_handle(Msg, _Conn, authorizing) ->
    {binary, M} = Msg,
    {_, {_, {_, Res}}}  = pb_stream:decode_msg(M, 'ProtobufStream.StreamMessage'),
    case Res of
        'AUTHENTICATED' ->
            {ok, authenticated};
        E ->
            {close, <<>>, E}
    end;

websocket_handle({binary, Msg}, _ConnState, State) ->
    %io:format("Received msg ~p ~p~n", [_T, Msg]),
    {_, {Kind, M}} = pb_stream:decode_msg(Msg, 'ProtobufStream.StreamMessage'),
%    io:format("~p ~p ~n", [Kind, M]),
    case Kind of 
        subscriptionResult ->
            handle_subs_result(M, State);
        marketUpdate ->
            handle_market_update(M,State)
    end,        
    {ok, State}.

%%====================================================================
%% Internal functions
%%====================================================================
authenticate() ->
    Api =  "02902WOKNKEJN01DV18Z",
    Secret = "UIO/BJfSyRyGN/zfPdag9AVVzWRHxQ4mYime6FSo",
    Nonce = integer_to_list(erlang:system_time(millisecond) * 1000 * 1000),
    Token = base64:encode_to_string(crypto:hmac(sha512, base64:decode(Secret), "stream_access;access_key_id=" ++ Api ++ ";nonce=" ++ Nonce ++ ";")),

    Msg = #'ProtobufClient.APIAuthenticationMessage'{token=Token, nonce=Nonce, api_key=Api, subscriptions=["markets:65:trades"]},
    websocket_client:cast(self(), {text, pb_client:encode_msg(#'ProtobufClient.ClientMessage'{body={apiAuthentication, Msg}})}).

handle_market_update(Msg, State) ->
    M = Msg#'ProtobufMarkets.MarketUpdateMessage'.'Update',
    io:format("~p~n", [M]).

handle_subs_result(M, State) ->
    %io:format("~p~n", [M#'ProtobufStream.SubscriptionResult']).
    io:format("~p~n", [M]).

