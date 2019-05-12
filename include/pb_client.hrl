%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.7.1

-ifndef(pb_client).
-define(pb_client, true).

-define(pb_client_gpb_version, "4.7.1").

-ifndef('PROTOBUFCLIENT.CLIENTMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTMESSAGE_PB_H', true).
-record('ProtobufClient.ClientMessage',
        {body                   :: {identification, pb_client:'ProtobufClient.ClientIdentificationMessage'()} | {subscribe, pb_client:'ProtobufClient.ClientSubscribeMessage'()} | {unsubscribe, pb_client:'ProtobufClient.ClientUnsubscribeMessage'()} | {webAuthentication, pb_client:'ProtobufClient.WebAuthenticationMessage'()} | {apiAuthentication, pb_client:'ProtobufClient.APIAuthenticationMessage'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTIDENTIFICATIONMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTIDENTIFICATIONMESSAGE_PB_H', true).
-record('ProtobufClient.ClientIdentificationMessage',
        {useragent = []         :: iolist() | undefined, % = 1
         revision = []          :: iolist() | undefined, % = 2
         integration = []       :: iolist() | undefined, % = 3
         locale = []            :: iolist() | undefined, % = 4
         subscriptions = []     :: [iolist()] | undefined % = 5
        }).
-endif.

-ifndef('PROTOBUFCLIENT.WEBAUTHENTICATIONMESSAGE_PB_H').
-define('PROTOBUFCLIENT.WEBAUTHENTICATIONMESSAGE_PB_H', true).
-record('ProtobufClient.WebAuthenticationMessage',
        {identification = undefined :: pb_client:'ProtobufClient.ClientIdentificationMessage'() | undefined, % = 1
         token = []             :: iolist() | undefined, % = 2
         nonce = []             :: iolist() | undefined, % = 3
         access_list = []       :: [iolist()] | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFCLIENT.TRADESESSIONAUTH_PB_H').
-define('PROTOBUFCLIENT.TRADESESSIONAUTH_PB_H', true).
-record('ProtobufClient.TradeSessionAuth',
        {api_key = []           :: iolist() | undefined, % = 1
         api_secret = []        :: iolist() | undefined, % = 2
         customer_id = []       :: iolist() | undefined, % = 3
         key_passphrase = []    :: iolist() | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFCLIENT.TRADESUBSCRIPTION_PB_H').
-define('PROTOBUFCLIENT.TRADESUBSCRIPTION_PB_H', true).
-record('ProtobufClient.TradeSubscription',
        {marketId = []          :: iolist() | undefined, % = 1
         auth = undefined       :: pb_client:'ProtobufClient.TradeSessionAuth'() | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFCLIENT.STREAMSUBSCRIPTION_PB_H').
-define('PROTOBUFCLIENT.STREAMSUBSCRIPTION_PB_H', true).
-record('ProtobufClient.StreamSubscription',
        {resource = []          :: iolist() | undefined % = 1
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTSUBSCRIPTION_PB_H').
-define('PROTOBUFCLIENT.CLIENTSUBSCRIPTION_PB_H', true).
-record('ProtobufClient.ClientSubscription',
        {body                   :: {stream_subscription, pb_client:'ProtobufClient.StreamSubscription'()} | {trade_subscription, pb_client:'ProtobufClient.TradeSubscription'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFCLIENT.APIAUTHENTICATIONMESSAGE_PB_H').
-define('PROTOBUFCLIENT.APIAUTHENTICATIONMESSAGE_PB_H', true).
-record('ProtobufClient.APIAuthenticationMessage',
        {token = []             :: iolist() | undefined, % = 1
         nonce = []             :: iolist() | undefined, % = 2
         api_key = []           :: iolist() | undefined, % = 3
         source = 'UNKNOWN'     :: 'UNKNOWN' | 'GOLANG_SDK' | 'JAVASCRIPT_SDK' | 'NODE_SDK' | 'RUST_SDK' | 'CW_WEB' | integer() | undefined, % = 4, enum ProtobufClient.APIAuthenticationMessage.Source
         version = []           :: iolist() | undefined, % = 5
         subscriptions = []     :: [iolist()] | undefined, % = 6
         client_subscriptions = [] :: [pb_client:'ProtobufClient.ClientSubscription'()] | undefined % = 7
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTSESSIONMESSAGE.SESSION_PB_H').
-define('PROTOBUFCLIENT.CLIENTSESSIONMESSAGE.SESSION_PB_H', true).
-record('ProtobufClient.ClientSessionMessage.Session',
        {userId = []            :: iolist() | undefined, % = 1
         expires = 0            :: integer() | undefined, % = 2, 32 bits
         token = []             :: iolist() | undefined, % = 3
         mfaToken = []          :: iolist() | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTSESSIONMESSAGE.ANONYMOUSTRADINGSESSION_PB_H').
-define('PROTOBUFCLIENT.CLIENTSESSIONMESSAGE.ANONYMOUSTRADINGSESSION_PB_H', true).
-record('ProtobufClient.ClientSessionMessage.AnonymousTradingSession',
        {exchange = []          :: iolist() | undefined, % = 1
         token = []             :: iolist() | undefined, % = 2
         expiration = 0         :: integer() | undefined % = 3, 32 bits
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTSESSIONMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTSESSIONMESSAGE_PB_H', true).
-record('ProtobufClient.ClientSessionMessage',
        {'SessionConfig'        :: {session, pb_client:'ProtobufClient.ClientSessionMessage.Session'()} | {anonymousTradingSession, pb_client:'ProtobufClient.ClientSessionMessage.AnonymousTradingSession'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTSUBSCRIBEMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTSUBSCRIBEMESSAGE_PB_H', true).
-record('ProtobufClient.ClientSubscribeMessage',
        {subscriptionKeys = []  :: [iolist()] | undefined, % = 1
         subscriptions = []     :: [pb_client:'ProtobufClient.ClientSubscription'()] | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTUNSUBSCRIBEMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTUNSUBSCRIBEMESSAGE_PB_H', true).
-record('ProtobufClient.ClientUnsubscribeMessage',
        {subscriptionKeys = []  :: [iolist()] | undefined, % = 1
         subscriptions = []     :: [pb_client:'ProtobufClient.ClientSubscription'()] | undefined % = 2
        }).
-endif.

-endif.