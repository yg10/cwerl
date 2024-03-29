%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.7.1

-ifndef(pb_stream).
-define(pb_stream, true).

-define(pb_stream_gpb_version, "4.7.1").

-ifndef('PROTOBUFSTREAM.STREAMMESSAGE_PB_H').
-define('PROTOBUFSTREAM.STREAMMESSAGE_PB_H', true).
-record('ProtobufStream.StreamMessage',
        {body                   :: {authenticationResult, pb_stream:'ProtobufStream.AuthenticationResult'()} | {subscriptionResult, pb_stream:'ProtobufStream.SubscriptionResult'()} | {unsubscriptionResult, pb_stream:'ProtobufStream.UnsubscriptionResult'()} | {missedMessages, pb_stream:'ProtobufStream.MissedMessages'()} | {marketUpdate, pb_stream:'ProtobufMarkets.MarketUpdateMessage'()} | {pairUpdate, pb_stream:'ProtobufMarkets.PairUpdateMessage'()} | {assetUpdate, pb_stream:'ProtobufMarkets.AssetUpdateMessage'()} | {indexUpdate, pb_stream:'ProtobufMarkets.IndexUpdateMessage'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFSTREAM.AUTHENTICATIONRESULT_PB_H').
-define('PROTOBUFSTREAM.AUTHENTICATIONRESULT_PB_H', true).
-record('ProtobufStream.AuthenticationResult',
        {status = 'UNKNOWN'     :: 'UNKNOWN' | 'AUTHENTICATED' | 'BAD_NONCE' | 'BAD_TOKEN' | 'TOKEN_EXPIRED' | integer() | undefined % = 1, enum ProtobufStream.AuthenticationResult.Status
        }).
-endif.

-ifndef('PROTOBUFSTREAM.SUBSCRIPTIONRESULT_PB_H').
-define('PROTOBUFSTREAM.SUBSCRIPTIONRESULT_PB_H', true).
-record('ProtobufStream.SubscriptionResult',
        {subscribed = []        :: [iolist()] | undefined, % = 1
         failed = []            :: [pb_stream:'ProtobufStream.SubscribeError'()] | undefined, % = 2
         status = undefined     :: pb_stream:'ProtobufStream.SubscriptionStatus'() | undefined, % = 3
         subscriptions = []     :: [pb_stream:'ProtobufClient.ClientSubscription'()] | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFSTREAM.UNSUBSCRIPTIONRESULT_PB_H').
-define('PROTOBUFSTREAM.UNSUBSCRIPTIONRESULT_PB_H', true).
-record('ProtobufStream.UnsubscriptionResult',
        {unsubscribed = []      :: [iolist()] | undefined, % = 1
         failed = []            :: [pb_stream:'ProtobufStream.UnsubscribeError'()] | undefined, % = 2
         status = undefined     :: pb_stream:'ProtobufStream.SubscriptionStatus'() | undefined, % = 3
         subscriptions = []     :: [pb_stream:'ProtobufClient.ClientSubscription'()] | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFSTREAM.SUBSCRIBEERROR_PB_H').
-define('PROTOBUFSTREAM.SUBSCRIBEERROR_PB_H', true).
-record('ProtobufStream.SubscribeError',
        {key = []               :: iolist() | undefined, % = 1
         error = []             :: iolist() | undefined, % = 2
         subscription = undefined :: pb_stream:'ProtobufClient.ClientSubscription'() | undefined % = 3
        }).
-endif.

-ifndef('PROTOBUFSTREAM.UNSUBSCRIBEERROR_PB_H').
-define('PROTOBUFSTREAM.UNSUBSCRIBEERROR_PB_H', true).
-record('ProtobufStream.UnsubscribeError',
        {key = []               :: iolist() | undefined, % = 1
         error = []             :: iolist() | undefined, % = 2
         subscription = undefined :: pb_stream:'ProtobufClient.ClientSubscription'() | undefined % = 3
        }).
-endif.

-ifndef('PROTOBUFSTREAM.SUBSCRIPTIONSTATUS_PB_H').
-define('PROTOBUFSTREAM.SUBSCRIPTIONSTATUS_PB_H', true).
-record('ProtobufStream.SubscriptionStatus',
        {keys = []              :: [iolist()] | undefined, % = 1
         subscriptions = []     :: [pb_stream:'ProtobufClient.ClientSubscription'()] | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFSTREAM.MISSEDMESSAGES_PB_H').
-define('PROTOBUFSTREAM.MISSEDMESSAGES_PB_H', true).
-record('ProtobufStream.MissedMessages',
        {numMissedMessages = 0  :: integer() | undefined % = 1, 32 bits
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTMESSAGE_PB_H', true).
-record('ProtobufClient.ClientMessage',
        {body                   :: {identification, pb_stream:'ProtobufClient.ClientIdentificationMessage'()} | {subscribe, pb_stream:'ProtobufClient.ClientSubscribeMessage'()} | {unsubscribe, pb_stream:'ProtobufClient.ClientUnsubscribeMessage'()} | {webAuthentication, pb_stream:'ProtobufClient.WebAuthenticationMessage'()} | {apiAuthentication, pb_stream:'ProtobufClient.APIAuthenticationMessage'()} | undefined % oneof
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
        {identification = undefined :: pb_stream:'ProtobufClient.ClientIdentificationMessage'() | undefined, % = 1
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
         auth = undefined       :: pb_stream:'ProtobufClient.TradeSessionAuth'() | undefined % = 2
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
        {body                   :: {stream_subscription, pb_stream:'ProtobufClient.StreamSubscription'()} | {trade_subscription, pb_stream:'ProtobufClient.TradeSubscription'()} | undefined % oneof
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
         client_subscriptions = [] :: [pb_stream:'ProtobufClient.ClientSubscription'()] | undefined % = 7
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
        {'SessionConfig'        :: {session, pb_stream:'ProtobufClient.ClientSessionMessage.Session'()} | {anonymousTradingSession, pb_stream:'ProtobufClient.ClientSessionMessage.AnonymousTradingSession'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTSUBSCRIBEMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTSUBSCRIBEMESSAGE_PB_H', true).
-record('ProtobufClient.ClientSubscribeMessage',
        {subscriptionKeys = []  :: [iolist()] | undefined, % = 1
         subscriptions = []     :: [pb_stream:'ProtobufClient.ClientSubscription'()] | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFCLIENT.CLIENTUNSUBSCRIBEMESSAGE_PB_H').
-define('PROTOBUFCLIENT.CLIENTUNSUBSCRIBEMESSAGE_PB_H', true).
-record('ProtobufClient.ClientUnsubscribeMessage',
        {subscriptionKeys = []  :: [iolist()] | undefined, % = 1
         subscriptions = []     :: [pb_stream:'ProtobufClient.ClientSubscription'()] | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFMARKETS.MARKET_PB_H').
-define('PROTOBUFMARKETS.MARKET_PB_H', true).
-record('ProtobufMarkets.Market',
        {exchangeId = 0         :: non_neg_integer() | undefined, % = 3, 32 bits
         currencyPairId = 0     :: non_neg_integer() | undefined, % = 4, 32 bits
         marketId = 0           :: non_neg_integer() | undefined, % = 5, 32 bits
         exchange = []          :: iolist() | undefined, % = 1
         currencyPair = []      :: iolist() | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDER_PB_H').
-define('PROTOBUFMARKETS.ORDER_PB_H', true).
-record('ProtobufMarkets.Order',
        {priceStr = []          :: iolist() | undefined, % = 3
         amountStr = []         :: iolist() | undefined, % = 4
         price = 0.0            :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 1
         amount = 0.0           :: float() | integer() | infinity | '-infinity' | nan | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFMARKETS.TRADE_PB_H').
-define('PROTOBUFMARKETS.TRADE_PB_H', true).
-record('ProtobufMarkets.Trade',
        {externalId = []        :: iolist() | undefined, % = 11
         timestamp = 0          :: integer() | undefined, % = 2, 32 bits
         timestampMillis = 0    :: integer() | undefined, % = 5, 32 bits
         timestampNano = 0      :: integer() | undefined, % = 10, 32 bits
         priceStr = []          :: iolist() | undefined, % = 8
         amountStr = []         :: iolist() | undefined, % = 9
         price = 0.0            :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 3
         amount = 0.0           :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 4
         priceDouble = 0.0      :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 6
         amountDouble = 0.0     :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 7
         id = 0                 :: integer() | undefined % = 1, 32 bits
        }).
-endif.

-ifndef('PROTOBUFMARKETS.MARKETUPDATEMESSAGE_PB_H').
-define('PROTOBUFMARKETS.MARKETUPDATEMESSAGE_PB_H', true).
-record('ProtobufMarkets.MarketUpdateMessage',
        {market = undefined     :: pb_stream:'ProtobufMarkets.Market'() | undefined, % = 9
         'Update'               :: {orderBookUpdate, pb_stream:'ProtobufMarkets.OrderBookUpdate'()} | {orderBookDeltaUpdate, pb_stream:'ProtobufMarkets.OrderBookDeltaUpdate'()} | {orderBookSpreadUpdate, pb_stream:'ProtobufMarkets.OrderBookSpreadUpdate'()} | {tradesUpdate, pb_stream:'ProtobufMarkets.TradesUpdate'()} | {intervalsUpdate, pb_stream:'ProtobufMarkets.IntervalsUpdate'()} | {summaryUpdate, pb_stream:'ProtobufMarkets.SummaryUpdate'()} | {sparklineUpdate, pb_stream:'ProtobufMarkets.SparklineUpdate'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDERBOOKUPDATE_PB_H').
-define('PROTOBUFMARKETS.ORDERBOOKUPDATE_PB_H', true).
-record('ProtobufMarkets.OrderBookUpdate',
        {aggregationModulusStr = [] :: iolist() | undefined, % = 4
         seqNum = 0             :: integer() | undefined, % = 5, 32 bits
         bids = []              :: [pb_stream:'ProtobufMarkets.Order'()] | undefined, % = 1
         asks = []              :: [pb_stream:'ProtobufMarkets.Order'()] | undefined, % = 2
         aggregationModulus = 0.0 :: float() | integer() | infinity | '-infinity' | nan | undefined % = 3
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDERBOOKDELTAUPDATE.ORDERDELTAS_PB_H').
-define('PROTOBUFMARKETS.ORDERBOOKDELTAUPDATE.ORDERDELTAS_PB_H', true).
-record('ProtobufMarkets.OrderBookDeltaUpdate.OrderDeltas',
        {set = []               :: [pb_stream:'ProtobufMarkets.Order'()] | undefined, % = 1
         delta = []             :: [pb_stream:'ProtobufMarkets.Order'()] | undefined, % = 2
         remove = []            :: [float() | integer() | infinity | '-infinity' | nan] | undefined, % = 3
         removeStr = []         :: [iolist()] | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDERBOOKDELTAUPDATE_PB_H').
-define('PROTOBUFMARKETS.ORDERBOOKDELTAUPDATE_PB_H', true).
-record('ProtobufMarkets.OrderBookDeltaUpdate',
        {aggregationModulus = 0.0 :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 3
         aggregationModulusStr = [] :: iolist() | undefined, % = 4
         seqNum = 0             :: integer() | undefined, % = 5, 32 bits
         bids = undefined       :: pb_stream:'ProtobufMarkets.OrderBookDeltaUpdate.OrderDeltas'() | undefined, % = 1
         asks = undefined       :: pb_stream:'ProtobufMarkets.OrderBookDeltaUpdate.OrderDeltas'() | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDERBOOKSPREADUPDATE_PB_H').
-define('PROTOBUFMARKETS.ORDERBOOKSPREADUPDATE_PB_H', true).
-record('ProtobufMarkets.OrderBookSpreadUpdate',
        {timestamp = 0          :: integer() | undefined, % = 1, 32 bits
         bid = undefined        :: pb_stream:'ProtobufMarkets.Order'() | undefined, % = 2
         ask = undefined        :: pb_stream:'ProtobufMarkets.Order'() | undefined % = 3
        }).
-endif.

-ifndef('PROTOBUFMARKETS.TRADESUPDATE_PB_H').
-define('PROTOBUFMARKETS.TRADESUPDATE_PB_H', true).
-record('ProtobufMarkets.TradesUpdate',
        {trades = []            :: [pb_stream:'ProtobufMarkets.Trade'()] | undefined % = 1
        }).
-endif.

-ifndef('PROTOBUFMARKETS.INTERVAL.OHLC_PB_H').
-define('PROTOBUFMARKETS.INTERVAL.OHLC_PB_H', true).
-record('ProtobufMarkets.Interval.OHLC',
        {openStr = []           :: iolist() | undefined, % = 5
         highStr = []           :: iolist() | undefined, % = 6
         lowStr = []            :: iolist() | undefined, % = 7
         closeStr = []          :: iolist() | undefined, % = 8
         open = 0.0             :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 1
         high = 0.0             :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 2
         low = 0.0              :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 3
         close = 0.0            :: float() | integer() | infinity | '-infinity' | nan | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFMARKETS.INTERVAL_PB_H').
-define('PROTOBUFMARKETS.INTERVAL_PB_H', true).
-record('ProtobufMarkets.Interval',
        {closetime = 0          :: integer() | undefined, % = 1, 32 bits
         period = 0             :: integer() | undefined, % = 4, 32 bits
         ohlc = undefined       :: pb_stream:'ProtobufMarkets.Interval.OHLC'() | undefined, % = 2
         volumeBaseStr = []     :: iolist() | undefined, % = 6
         volumeQuoteStr = []    :: iolist() | undefined, % = 7
         volumeBase = 0.0       :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 3
         volumeQuote = 0.0      :: float() | integer() | infinity | '-infinity' | nan | undefined % = 5
        }).
-endif.

-ifndef('PROTOBUFMARKETS.INTERVALSUPDATE_PB_H').
-define('PROTOBUFMARKETS.INTERVALSUPDATE_PB_H', true).
-record('ProtobufMarkets.IntervalsUpdate',
        {intervals = []         :: [pb_stream:'ProtobufMarkets.Interval'()] | undefined % = 1
        }).
-endif.

-ifndef('PROTOBUFMARKETS.SUMMARYUPDATE_PB_H').
-define('PROTOBUFMARKETS.SUMMARYUPDATE_PB_H', true).
-record('ProtobufMarkets.SummaryUpdate',
        {lastStr = []           :: iolist() | undefined, % = 10
         highStr = []           :: iolist() | undefined, % = 11
         lowStr = []            :: iolist() | undefined, % = 12
         volumeBaseStr = []     :: iolist() | undefined, % = 13
         volumeQuoteStr = []    :: iolist() | undefined, % = 14
         changeAbsoluteStr = [] :: iolist() | undefined, % = 15
         changePercentStr = []  :: iolist() | undefined, % = 16
         numTrades = 0          :: integer() | undefined, % = 8, 32 bits
         last = 0.0             :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 2
         high = 0.0             :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 3
         low = 0.0              :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 4
         volumeBase = 0.0       :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 5
         volumeQuote = 0.0      :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 9
         changeAbsolute = 0.0   :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 6
         changePercent = 0.0    :: float() | integer() | infinity | '-infinity' | nan | undefined % = 7
        }).
-endif.

-ifndef('PROTOBUFMARKETS.SPARKLINEUPDATE_PB_H').
-define('PROTOBUFMARKETS.SPARKLINEUPDATE_PB_H', true).
-record('ProtobufMarkets.SparklineUpdate',
        {time = 0               :: integer() | undefined, % = 2, 32 bits
         price = 0.0            :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 3
         priceStr = []          :: iolist() | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFMARKETS.INDEX_PB_H').
-define('PROTOBUFMARKETS.INDEX_PB_H', true).
-record('ProtobufMarkets.Index',
        {id = 0                 :: non_neg_integer() | undefined, % = 1, 32 bits
         symbol = []            :: iolist() | undefined, % = 2
         indexType = []         :: iolist() | undefined, % = 3
         cwIndex = false        :: boolean() | 0 | 1 | undefined, % = 4
         exchangeId = 0         :: non_neg_integer() | undefined, % = 5, 32 bits
         instrumentId = 0       :: non_neg_integer() | undefined % = 6, 32 bits
        }).
-endif.

-ifndef('PROTOBUFMARKETS.INDEXUPDATEMESSAGE_PB_H').
-define('PROTOBUFMARKETS.INDEXUPDATEMESSAGE_PB_H', true).
-record('ProtobufMarkets.IndexUpdateMessage',
        {index = undefined      :: pb_stream:'ProtobufMarkets.Index'() | undefined, % = 1
         'Update'               :: {tickerUpdate, pb_stream:'ProtobufMarkets.TickerUpdate'()} | {intervalsUpdate, pb_stream:'ProtobufMarkets.IntervalsUpdate'()} | {summaryUpdate, pb_stream:'ProtobufMarkets.SummaryUpdate'()} | {sparklineUpdate, pb_stream:'ProtobufMarkets.SparklineUpdate'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFMARKETS.TICKERUPDATE_PB_H').
-define('PROTOBUFMARKETS.TICKERUPDATE_PB_H', true).
-record('ProtobufMarkets.TickerUpdate',
        {tickers = []           :: [pb_stream:'ProtobufMarkets.Ticker'()] | undefined % = 1
        }).
-endif.

-ifndef('PROTOBUFMARKETS.TICKER_PB_H').
-define('PROTOBUFMARKETS.TICKER_PB_H', true).
-record('ProtobufMarkets.Ticker',
        {value = []             :: iolist() | undefined, % = 1
         timestamp = 0          :: integer() | undefined, % = 2, 32 bits
         timestampNano = 0      :: integer() | undefined % = 3, 32 bits
        }).
-endif.

-ifndef('PROTOBUFMARKETS.PAIRUPDATEMESSAGE_PB_H').
-define('PROTOBUFMARKETS.PAIRUPDATEMESSAGE_PB_H', true).
-record('ProtobufMarkets.PairUpdateMessage',
        {pair = 0               :: non_neg_integer() | undefined, % = 1, 32 bits
         'Update'               :: {vwapUpdate, pb_stream:'ProtobufMarkets.PairVwapUpdate'()} | {performanceUpdate, pb_stream:'ProtobufMarkets.PairPerformanceUpdate'()} | {trendlineUpdate, pb_stream:'ProtobufMarkets.PairTrendlineUpdate'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFMARKETS.PAIRVWAPUPDATE_PB_H').
-define('PROTOBUFMARKETS.PAIRVWAPUPDATE_PB_H', true).
-record('ProtobufMarkets.PairVwapUpdate',
        {vwap = 0.0             :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 1
         timestamp = 0          :: integer() | undefined % = 2, 32 bits
        }).
-endif.

-ifndef('PROTOBUFMARKETS.PAIRPERFORMANCEUPDATE_PB_H').
-define('PROTOBUFMARKETS.PAIRPERFORMANCEUPDATE_PB_H', true).
-record('ProtobufMarkets.PairPerformanceUpdate',
        {window = []            :: iolist() | undefined, % = 1
         performance = 0.0      :: float() | integer() | infinity | '-infinity' | nan | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFMARKETS.PAIRTRENDLINEUPDATE_PB_H').
-define('PROTOBUFMARKETS.PAIRTRENDLINEUPDATE_PB_H', true).
-record('ProtobufMarkets.PairTrendlineUpdate',
        {window = []            :: iolist() | undefined, % = 1
         time = 0               :: integer() | undefined, % = 2, 32 bits
         price = []             :: iolist() | undefined, % = 3
         volume = []            :: iolist() | undefined % = 4
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ASSETUPDATEMESSAGE_PB_H').
-define('PROTOBUFMARKETS.ASSETUPDATEMESSAGE_PB_H', true).
-record('ProtobufMarkets.AssetUpdateMessage',
        {asset = 0              :: integer() | undefined, % = 1, 32 bits
         'Update'               :: {usdVolumeUpdate, pb_stream:'ProtobufMarkets.AssetUSDVolumeUpdate'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ASSETUSDVOLUMEUPDATE_PB_H').
-define('PROTOBUFMARKETS.ASSETUSDVOLUMEUPDATE_PB_H', true).
-record('ProtobufMarkets.AssetUSDVolumeUpdate',
        {volume = []            :: iolist() | undefined % = 1
        }).
-endif.

-endif.
