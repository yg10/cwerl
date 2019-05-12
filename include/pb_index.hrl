%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.7.1

-ifndef(pb_index).
-define(pb_index, true).

-define(pb_index_gpb_version, "4.7.1").

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
        {index = undefined      :: pb_index:'ProtobufMarkets.Index'() | undefined, % = 1
         'Update'               :: {tickerUpdate, pb_index:'ProtobufMarkets.TickerUpdate'()} | {intervalsUpdate, pb_index:'ProtobufMarkets.IntervalsUpdate'()} | {summaryUpdate, pb_index:'ProtobufMarkets.SummaryUpdate'()} | {sparklineUpdate, pb_index:'ProtobufMarkets.SparklineUpdate'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFMARKETS.TICKERUPDATE_PB_H').
-define('PROTOBUFMARKETS.TICKERUPDATE_PB_H', true).
-record('ProtobufMarkets.TickerUpdate',
        {tickers = []           :: [pb_index:'ProtobufMarkets.Ticker'()] | undefined % = 1
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
        {market = undefined     :: pb_index:'ProtobufMarkets.Market'() | undefined, % = 9
         'Update'               :: {orderBookUpdate, pb_index:'ProtobufMarkets.OrderBookUpdate'()} | {orderBookDeltaUpdate, pb_index:'ProtobufMarkets.OrderBookDeltaUpdate'()} | {orderBookSpreadUpdate, pb_index:'ProtobufMarkets.OrderBookSpreadUpdate'()} | {tradesUpdate, pb_index:'ProtobufMarkets.TradesUpdate'()} | {intervalsUpdate, pb_index:'ProtobufMarkets.IntervalsUpdate'()} | {summaryUpdate, pb_index:'ProtobufMarkets.SummaryUpdate'()} | {sparklineUpdate, pb_index:'ProtobufMarkets.SparklineUpdate'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDERBOOKUPDATE_PB_H').
-define('PROTOBUFMARKETS.ORDERBOOKUPDATE_PB_H', true).
-record('ProtobufMarkets.OrderBookUpdate',
        {aggregationModulusStr = [] :: iolist() | undefined, % = 4
         seqNum = 0             :: integer() | undefined, % = 5, 32 bits
         bids = []              :: [pb_index:'ProtobufMarkets.Order'()] | undefined, % = 1
         asks = []              :: [pb_index:'ProtobufMarkets.Order'()] | undefined, % = 2
         aggregationModulus = 0.0 :: float() | integer() | infinity | '-infinity' | nan | undefined % = 3
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDERBOOKDELTAUPDATE.ORDERDELTAS_PB_H').
-define('PROTOBUFMARKETS.ORDERBOOKDELTAUPDATE.ORDERDELTAS_PB_H', true).
-record('ProtobufMarkets.OrderBookDeltaUpdate.OrderDeltas',
        {set = []               :: [pb_index:'ProtobufMarkets.Order'()] | undefined, % = 1
         delta = []             :: [pb_index:'ProtobufMarkets.Order'()] | undefined, % = 2
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
         bids = undefined       :: pb_index:'ProtobufMarkets.OrderBookDeltaUpdate.OrderDeltas'() | undefined, % = 1
         asks = undefined       :: pb_index:'ProtobufMarkets.OrderBookDeltaUpdate.OrderDeltas'() | undefined % = 2
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ORDERBOOKSPREADUPDATE_PB_H').
-define('PROTOBUFMARKETS.ORDERBOOKSPREADUPDATE_PB_H', true).
-record('ProtobufMarkets.OrderBookSpreadUpdate',
        {timestamp = 0          :: integer() | undefined, % = 1, 32 bits
         bid = undefined        :: pb_index:'ProtobufMarkets.Order'() | undefined, % = 2
         ask = undefined        :: pb_index:'ProtobufMarkets.Order'() | undefined % = 3
        }).
-endif.

-ifndef('PROTOBUFMARKETS.TRADESUPDATE_PB_H').
-define('PROTOBUFMARKETS.TRADESUPDATE_PB_H', true).
-record('ProtobufMarkets.TradesUpdate',
        {trades = []            :: [pb_index:'ProtobufMarkets.Trade'()] | undefined % = 1
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
         ohlc = undefined       :: pb_index:'ProtobufMarkets.Interval.OHLC'() | undefined, % = 2
         volumeBaseStr = []     :: iolist() | undefined, % = 6
         volumeQuoteStr = []    :: iolist() | undefined, % = 7
         volumeBase = 0.0       :: float() | integer() | infinity | '-infinity' | nan | undefined, % = 3
         volumeQuote = 0.0      :: float() | integer() | infinity | '-infinity' | nan | undefined % = 5
        }).
-endif.

-ifndef('PROTOBUFMARKETS.INTERVALSUPDATE_PB_H').
-define('PROTOBUFMARKETS.INTERVALSUPDATE_PB_H', true).
-record('ProtobufMarkets.IntervalsUpdate',
        {intervals = []         :: [pb_index:'ProtobufMarkets.Interval'()] | undefined % = 1
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

-endif.