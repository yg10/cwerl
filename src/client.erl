-module(client).

-behaviour(websocket_client).

-include("pb_client.hrl").
-include("pb_stream.hrl").

-export([
         start_link/0,
         init/1,
         onconnect/2,
         ondisconnect/2,
         websocket_handle/3,
         websocket_info/3,
         websocket_terminate/3,
         auth/0
         
        ]).

start_link() ->
    crypto:start(),
    ssl:start(),
    websocket_client:start_link("wss://stream.cryptowat.ch", ?MODULE, []).

init([]) ->
        {once, disconnected}.
    
onconnect(_WSReq, _State) ->
    auth(),
    {ok, authorizing}.

ondisconnect({remote, closed}, State) ->
    {reconnect, State}.

websocket_terminate(Reason, _ConnState, State) ->
    io:format("Websocket closed in state ~p with reason ~p~n", [State, Reason]),
    ok.

%websocket_handle({_T, Msg}, _ConnState, State) ->
        %io:format("Received msg ~p ~p~n", [_T, Msg]);

websocket_handle({binary,<<1>>}, _Conn, State) ->
     {ok, State};

websocket_handle(Msg, _Conn, authorizing) ->
    {binary, M} = Msg,
    {_, {_, {_, Res}}}  = pb_stream:decode_msg(M, 'ProtobufStream.StreamMessage'),
    io:format("auth: ~p~n", [Res]),
    case Res of
        'AUTHENTICATED' ->
            {ok, authenticated};
        _ ->
            {close, <<>>, auth_err}
    end.

websocket_info(_A, _ConnState, State) ->
    {reply, {text, <<"erlang message received">>}, State}.

auth() -> 
    Api = "02902WOKNKEJN01DV18Z",
    Secret = "UIO/BJfSyRyGN/zfPdag9AVVzWRHxQ4mYime6FSo",

%     Token = "8T4+x27qTJymiNVOQQLuDjzoiJL0LDhcgdFJM6HSjEV8BGGDG9ahYPFKGd3N1tH5CrfbrvgrjvvQsE3a0UImDg==",
%     Nonce = "1557255730270000000",
     
    Nonce = integer_to_list(erlang:system_time(millisecond) * 1000 * 1000),
    Token = base64:encode_to_string(crypto:hmac(sha512, base64:decode(Secret), "stream_access;access_key_id=" ++ Api ++ ";nonce=" ++ Nonce ++ ";")),
%    H = crypto:hmac_init(sha512, base64:encode(Secret)),
%    H1 = crypto:hmac_update(H, "stream_access;access_key_id=" ++ Api ++ ";nonce=" ++ Nonce),
    io:format("h: ~p~n", ["stream_access;access_key_id=" ++ Api ++ ";nonce=" ++ Nonce]),
%    Token = base64:encode(crypto:hmac_final(H1)),
%    [Token | _] = io_lib:format("~.16b", [crypto:bytes_to_integer(crypto:hmac(sha512, base64:encode(Secret), Nonce))]),
    Amsg = #'ProtobufClient.APIAuthenticationMessage'{token=Token, nonce=Nonce, api_key=Api},
    C = #'ProtobufClient.ClientMessage'{body={apiAuthentication, Amsg}},
    io:format("client.msg: ~p ~n", [C]),
    websocket_client:cast(self(), {text, pb_client:encode_msg(C)}).





