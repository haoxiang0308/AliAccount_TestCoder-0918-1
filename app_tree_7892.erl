%% OTP Application with Supervisor Tree
%% This file defines a complete OTP application with a supervisor and worker process

-module(app_tree_7892).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% Supervisor callbacks
-behaviour(supervisor).
-export([init/1]).

%% API
-export([start_link/0]).

%% Main application start function
start(_StartType, _StartArgs) ->
    start_link().

stop(_State) ->
    ok.

%% Start the supervisor
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% Supervisor initialization
init([]) ->
    % Define child specifications for the supervisor
    ChildSpecs = [
        {worker_process, 
         {worker_process, start_link, []},
         permanent, 
         5000, 
         worker, 
         [worker_process]}
    ],
    % Return supervisor specification with one_for_one restart strategy
    {ok, {{one_for_one, 5, 60}, ChildSpecs}}.

%% Simple worker process module
-module(worker_process).
-behaviour(gen_server).

%% API
-export([start_link/0]).

%% Gen server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    % Initialize the worker state
    {ok, #{message => "Hello from worker process"}}.

handle_call(get_state, _From, State) ->
    % Handle a synchronous call to get the current state
    {reply, State, State};

handle_call(_Request, _From, State) ->
    % Default response for other calls
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    % Handle asynchronous messages
    {noreply, State}.

handle_info(_Info, State) ->
    % Handle other messages
    {noreply, State}.

terminate(_Reason, _State) ->
    % Cleanup when process terminates
    ok.

code_change(_OldVsn, State, _Extra) ->
    % Handle code changes
    {ok, State}.