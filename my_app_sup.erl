-module(my_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 1000,
    MaxTime = 3600,
    SupFlags = {RestartStrategy, MaxRestarts, MaxTime},
    
    ChildSpecs = [
        {my_worker, 
         {my_worker, start_link, []},
         permanent, 
         5000, 
         worker, 
         [my_worker]}
    ],
    
    {ok, {SupFlags, ChildSpecs}}.