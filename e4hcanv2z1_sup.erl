%%====================================================================
%% Supervisor for e4hcanv2z1 OTP Application
%%====================================================================

-module(e4hcanv2z1_sup).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

init([]) ->
    SupFlags = #{strategy => one_for_one,
                 intensity => 5,
                 period => 60},
    
    ChildSpecs = [
        #{id => e4hcanv2z1_worker,
          start => {e4hcanv2z1_worker, start_link, []},
          restart => permanent,
          shutdown => 5000,
          type => worker,
          modules => [e4hcanv2z1_worker]}
    ],
    
    {ok, {SupFlags, ChildSpecs}}.

%%====================================================================
%% Internal functions
%%====================================================================