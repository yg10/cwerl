%-ifndef(wsl_hrl).
-define(wsl_hrl, true).

-record(state, {status :: atom(), cbm :: module(), subscriptions :: [string()]}).
-record(creds, {api :: string(), secret :: string()}).

-type subscription() :: [string()] | [].

%-type subscriptionResult() ::

-record(market, {
    exchange_id =   0 :: non_neg_integer(),
    pair_id     =   0 :: non_neg_integer(),
    market_id   =   0 :: non_neg_integer()
}).

-record(trade, {
    timestamp :: integer(),
    price     :: float(),
    vol       :: float()
}).
-type trade() ::  #trade{}.

-record(tlist, {market :: #market{},
    trades :: [trade()]
}).