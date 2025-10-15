%% This file contains a complete OTP application supervision tree
%% It includes the application, supervisor, and a sample worker process

-module(supervisor_tree_12345).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% API
-export([start_worker/0, stop_worker/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    supervisor_tree_sup:start_link().

stop(_State) ->
    ok.

%% API functions
start_worker() ->
    supervisor:start_child(supervisor_tree_sup, worker_spec()).

stop_worker(Pid) ->
    supervisor:terminate_child(supervisor_tree_sup, Pid).

worker_spec() ->
    {my_worker, 
     {my_worker, start_link, []},
     permanent, 
     5000, 
     worker, 
     [my_worker]}.

%% Supervisor module
-module(supervisor_tree_sup).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Worker = {
        my_worker,
        {my_worker, start_link, []},
        permanent,
        5000,
        worker,
        [my_worker]
    },
    
    Children = [Worker],
    RestartStrategy = {one_for_one, 5, 10},
    {ok, {RestartStrategy, Children}}.

%% Worker module
-module(my_worker).
-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-record(state, {}).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    {ok, #state{}}.

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