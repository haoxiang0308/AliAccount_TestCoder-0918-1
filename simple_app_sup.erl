-module(simple_app_sup).
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
        % 添加一个简单的工作者进程作为子进程
        {simple_worker, {simple_worker, start_link, []}, permanent, 5000, worker, [simple_worker]}
    ],

    {ok, {SupFlags, ChildSpecs}}.