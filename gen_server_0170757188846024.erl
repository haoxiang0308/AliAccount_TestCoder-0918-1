-module(gen_server_0170757188846024).
-behaviour(gen_server).

%% API
-export([start_link/1, stop/1, increment/1, decrement/1, get_value/1, reset/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {value}).

%%%===================================================================
%%% API
%%%===================================================================

start_link(InitialValue) ->
    gen_server:start_link(?MODULE, InitialValue, []).

stop(Pid) ->
    gen_server:stop(Pid).

increment(Pid) ->
    gen_server:call(Pid, increment).

decrement(Pid) ->
    gen_server:call(Pid, decrement).

get_value(Pid) ->
    gen_server:call(Pid, get_value).

reset(Pid) ->
    gen_server:cast(Pid, reset).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init(InitialValue) ->
    {ok, #state{value = InitialValue}}.

handle_call(increment, _From, State) ->
    NewValue = State#state.value + 1,
    {reply, NewValue, State#state{value = NewValue}};
handle_call(decrement, _From, State) ->
    NewValue = State#state.value - 1,
    {reply, NewValue, State#state{value = NewValue}};
handle_call(get_value, _From, State) ->
    {reply, State#state.value, State}.

handle_cast(reset, State) ->
    {noreply, State#state{value = 0}}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
