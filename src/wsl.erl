-module(wsl).

-behaviour(websocket_client).

-include("wsl.hrl").
-include("pb_client.hrl").
-include("pb_stream.hrl").

-define(URL, "wss://stream.cryptowat.ch").

%% API exports
-export([start_link/1,
        init/1,
        subscribe/2,
        unsubscribe/2,
        stop/0]).

-export([onconnect/2,
        ondisconnect/2,
        websocket_handle/3,
        websocket_info/3,
        websocket_terminate/3]).

-type creds() :: #creds{}.
-callback get_creds() -> creds(). %{{api, string()}, {secret, string()}}.

-callback onsubscribe(subscription()) -> no_return().
-callback onunsubscribe(subscription()) -> no_return().

-callback subscriptionResult() -> no_return().

-optional_callbacks([onsubscribe/1, onunsubscribe/1]).


%%====================================================================
%% API functions
%%====================================================================

start_link(Args)  when is_list(Args) ->
    crypto:start(),
    ssl:start(),
    {ok, Pid} = websocket_client:start_link(?URL, ?MODULE, Args),
    Pid.


-spec subscribe(pid(), [iolist()]) -> no_return().
subscribe(P, S) ->
%    SS = #'ProtobufClient.StreamSubscription'{resource = S},
%    pb_client:verify_msg(SS, 'ProtobufClient.StreamSubscription'),
%    CS = #'ProtobufClient.ClientSubscription'{body = {stream_subscription,  #'ProtobufClient.StreamSubscription'{resource = S}}},
    X = #'ProtobufClient.ClientSubscribeMessage'{
        subscriptionKeys = S,
        subscriptions = []},
    io:format("subscr: ~p~n", [X]),
    ok = websocket_client:cast(P, {text, message:out_msg(subscribe, X)}).

-spec unsubscribe(pid(), [iolist()]) -> no_return().
unsubscribe(P, S) ->
    X = #'ProtobufClient.ClientUnsubscribeMessage'{
        subscriptionKeys = S,
        subscriptions = []},
        io:format("unsub: ~p~n", [X]),
        ok = websocket_client:cast(P, {text, message:out_msg(unsubscribe, X)}).

stop() -> {ok}.

init(Arg) ->
    {once, {disconnected, hd(Arg)}}.

onconnect(_WSReq, State) ->
    {disconnected, {Mod, Subs}}  = State,
    authenticate(Mod, Subs),
    {ok, {authorizing, {Mod, Subs}}}.
    
ondisconnect({remote, closed}, State) ->
    {reconnect, State}.

websocket_terminate(Reason, _ConnState, State) ->
    io:format("Websocket closed in state ~p with reason ~p~n", [State, Reason]),
    ok.

websocket_info(A, _ConnState, State) ->
    io:format("info: ~p~n", [A]),
    {reply, {text, A}, State}.

%% skip KA msg
websocket_handle({binary,<<1>>}, _Conn, State) ->
    {ok, State};

websocket_handle({binary, Msg}, _Conn, {authorizing, State})  ->
    {_,{_,{_, Res}}} = pb_stream:decode_msg(Msg, 'ProtobufStream.StreamMessage'),
    case  Res of
       'AUTHENTICATED' ->
           {ok, {connected, State}};
       E ->
           {close, <<>>, E}
    end;

%% Srream message
websocket_handle({binary, Msg}, _Conn, State) ->
    {Tag, M} = pb_stream:decode_msg(Msg, 'ProtobufStream.StreamMessage'),
    T = element(1, M),
    {_, {Mod, _}} = State,
    case erlang:function_exported(Mod, T, 1) of
        false ->
            io:format("~p~n", [M]),
            {ok, State};
        true ->
            {T1, M1} = M,
            Mod:T(message:in_msg(T1, M1)),
            {ok, State}
    end;

websocket_handle(M, _C, S) ->
    io:format("in1: ~p ~p ~n", [M, S]),
    {ok, S}.

%%====================================================================
%% Internal functions
%%====================================================================

-spec authenticate(M :: module(), S :: [string()]) -> any().
authenticate(M, S) ->
    {{api, Api}, {secret, Secret}} = M:get_creds(),
    Nonce = integer_to_list(erlang:system_time()),
    Token = base64:encode_to_string(crypto:hmac(sha512, base64:decode(Secret), "stream_access;access_key_id=" ++ Api ++ ";nonce=" ++ Nonce ++ ";")),
    Msg = #'ProtobufClient.APIAuthenticationMessage'{token = Token, nonce = Nonce, api_key = Api, subscriptions = S},
%    Msg = #'ProtobufClient.APIAuthenticationMessage'{token = Token, nonce = Nonce, api_key = Api, client_subscriptions = [#'ProtobufClient.ClientSubscription'{body = {stream_subscription, #'ProtobufClient.StreamSubscription'{resource = S}}}]},  %["markets:65:trades"]},

    websocket_client:cast(self(), {text, message:out_msg(apiAuthentication, Msg)}).


