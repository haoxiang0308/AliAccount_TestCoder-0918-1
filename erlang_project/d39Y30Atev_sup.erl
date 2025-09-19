-module(d39Y30Atev_sup).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

init([]) ->
    SupFlags = #{strategy => one_for_one,
                 intensity => 5,
                 period => 10},
    
    ChildSpecs = [#{id => d39Y30Atev,
                    start => {d39Y30Atev, start_link, []},
                    restart => permanent,
                    shutdown => 5000,
                    type => worker,
                    modules => [d39Y30Atev]}],
    
    {ok, {SupFlags, ChildSpecs}}.