%% OTP Application with Supervision Tree
%% This file contains the complete OTP application structure with supervisor and worker

-module(otp_sup_tree_909bfdd9).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% Supervisor callbacks
-behaviour(supervisor).
-export([start_link/0, init/1]).

%% Gen Server worker
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%% Application API
start(_StartType, _StartArgs) ->
    otp_sup_tree_909bfdd9:start_link().

stop(_State) ->
    ok.

%% Supervisor API
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 1000,
    MaxTime = 3600,
    SupFlags = {RestartStrategy, MaxRestarts, MaxTime},
    
    ChildSpecs = [
        {worker_example, 
         {otp_sup_tree_909bfdd9, start_link, []},
         permanent, 
         5000, 
         worker, 
         [otp_sup_tree_909bfdd9]}
    ],
    
    {ok, {SupFlags, ChildSpecs}}.

%% Gen Server implementation
init([]) ->
    {ok, #{}}.

handle_call(_Request, _From, State) ->
    {reply, ignored, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.