-module(random_gen_server_example).
-behaviour(gen_server).

%% API
-export([start_link/0, stop/1, increment/1, get_count/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {count = 0}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link(?MODULE, [], []).

stop(Pid) ->
    gen_server:stop(Pid).

increment(Pid) ->
    gen_server:call(Pid, increment).

get_count(Pid) ->
    gen_server:call(Pid, get_count).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(increment, _From, State) ->
    NewState = State#state{count = State#state.count + 1},
    {reply, ok, NewState};
handle_call(get_count, _From, State) ->
    {reply, State#state.count, State};
handle_call(_Request, _From, State) ->
    {reply, {error, unknown_call}, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
