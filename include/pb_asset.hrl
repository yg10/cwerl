%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.7.1

-ifndef(pb_asset).
-define(pb_asset, true).

-define(pb_asset_gpb_version, "4.7.1").

-ifndef('PROTOBUFMARKETS.ASSETUPDATEMESSAGE_PB_H').
-define('PROTOBUFMARKETS.ASSETUPDATEMESSAGE_PB_H', true).
-record('ProtobufMarkets.AssetUpdateMessage',
        {asset = 0              :: integer() | undefined, % = 1, 32 bits
         'Update'               :: {usdVolumeUpdate, pb_asset:'ProtobufMarkets.AssetUSDVolumeUpdate'()} | undefined % oneof
        }).
-endif.

-ifndef('PROTOBUFMARKETS.ASSETUSDVOLUMEUPDATE_PB_H').
-define('PROTOBUFMARKETS.ASSETUSDVOLUMEUPDATE_PB_H', true).
-record('ProtobufMarkets.AssetUSDVolumeUpdate',
        {volume = []            :: iolist() | undefined % = 1
        }).
-endif.

-endif.
