-module(wsl).

-behaviour(websocket_client).

-include("../include/wsl.hrl").
-define(URL, "wss://stream.cryptowat.ch").

%% API exports
-export([start_link/1,
        init/1,
        subscribe/1,
        unsubscribe/1,
        stop/0]).

-export([onconnect/2,
        ondisconnect/2,
        websocket_handle/3,
        websocket_info/3,
        websocket_terminate/3]).

-type creds() :: #creds{}.
-callback get_creds() -> creds(). %{{api, string()}, {secret, string()}}.

-callback onsubscribe(map()) -> term().
-callback onunsubscribe(map()) -> term().

-optional_callbacks([onsubscribe/1, onunsubscribe/1]).

%%====================================================================
%% API functions
%%====================================================================

start_link(Args)  when is_list(Args) ->
    crypto:start(),
    ssl:start(),
    websocket_client:start_link(?URL, ?MODULE, Args).

%-type subs() :: {atom(), int(), atom()}
-type subs_list() :: [iolist()].

-spec subscribe(subs_list()) -> no_return().
subscribe([S]) ->
    SS = #{body => {stream_subscription, #{resource => S}}},
    Z = #{body => {subscribe, #{body => {stream_subscription, #{resource => S} } } } },

    M = pb_client:encode_msg(Z, 'ProtobufClient.ClientMessage'),
    Y = pb_stream:decode_msg(M, 'ProtobufClient.ClientMessage'),
    io:format("Z: ~p~n~p~n", [Z, Y]),
    websocket_client:cast(self(), {text, M}).

-spec unsubscribe([subs]) -> no_return().
unsubscribe(S) ->
    ok.

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

websocket_info(_A, _ConnState, State) ->
    {reply, {text, <<"erlang message received">>}, State}.

%% skip KA msg
websocket_handle({binary,<<1>>}, _Conn, State) ->
    {ok, State};

websocket_handle({binary, Msg}, _Conn, {authorizing, State})  ->
    {authenticationResult, Z} = maps:get(body, pb_stream:decode_msg(Msg, 'ProtobufStream.StreamMessage')),
    case  maps:get(status, Z) of
       'AUTHENTICATED' ->
           {ok, {authenticated, State}};
       E ->
           {close, <<>>, E}
    end;

websocket_handle({binary, Msg}, _Conn, State) ->
try
    message:in_msg()maps:get(body, pb_stream:decode_msg(Msg, 'ProtobufStream.StreamMessage'))),
catch
    :  ->
end

    case Kind of
        subscriptionResult ->
            handle_subs_result(M, State);
        marketUpdate ->
            handle_market_update(M,State)
    end,        
    {ok, State};

websocket_handle(M, _C, S) ->
    io:format("~p ~p ~n", [M, S]).


%%====================================================================
%% Internal functions
%%====================================================================
-spec authenticate(M :: module(), S :: [string()]) -> any().
authenticate(M, S) ->
    {{api, Api}, {secret, Secret}} = M:get_creds(),
    Nonce = integer_to_list(erlang:system_time()),
    Token = base64:encode_to_string(crypto:hmac(sha512, base64:decode(Secret), "stream_access;access_key_id=" ++ Api ++ ";nonce=" ++ Nonce ++ ";")),
    Msg = #{token => Token, nonce => Nonce, api_key => Api,  subscriptions => S},  %["markets:65:trades"]},
    websocket_client:cast(self(), {text, message:out_msg(apiAuthentication, Msg)}).

handle_market_update(Msg, State) ->
%    M = Msg#'ProtobufMarkets.MarketUpdateMessage'.'Update',
    ok.
%    io:format("inmsg: ~p~n", [Msg]).

handle_subs_result(Msg, State) ->
    %io:format("subs msg: ~p ~n", [maps:get(maps:get(status, Msg)]).
    #{failed := Failed, status:=Status, subscriptions := Subs} = Msg,
    io:format("failed: ~p~n subs: ~p~nstatus: ~p ~n,", [Failed, Subs, Status])
    case Failed of
        []->

;
end.

