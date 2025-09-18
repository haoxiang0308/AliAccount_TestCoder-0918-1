-module(counter_app).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    counter_57b1584e:start_link().

stop(_State) ->
    ok.