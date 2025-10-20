%% OTP Application Supervision Tree
%% Randomly generated file name: e4hcanv2z1.erl

-module(e4hcanv2z1).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% API
-export([start_link/0]).

%%====================================================================
%% Application callbacks
%%====================================================================

start(_StartType, _StartArgs) ->
    e4hcanv2z1_sup:start_link().

stop(_State) ->
    ok.

%% API
start_link() ->
    application:start(?MODULE).

%%====================================================================
%% Internal functions
%%====================================================================