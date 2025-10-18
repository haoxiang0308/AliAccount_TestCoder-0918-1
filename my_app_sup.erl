-module(my_app_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % 定义子进程规格
    ChildSpecs = [
        #{id => my_worker1,
          start => {my_worker, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [my_worker]},
        #{id => my_worker2,
          start => {my_worker, start_link, [worker2]},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [my_worker]}
    ],
    
    % 定义监督策略
    SupFlags = #{strategy => one_for_one,
                 intensity => 10,
                 period => 100},
                 
    {ok, {SupFlags, ChildSpecs}}.