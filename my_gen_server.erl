-module(my_gen_server).
-behaviour(gen_server).

%% API
-export([start_link/0, get_state/0, update_state/1, stop/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%% State record
-record(state, {data = []}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

get_state() ->
    gen_server:call(?MODULE, get_state).

update_state(NewData) ->
    gen_server:cast(?MODULE, {update_state, NewData}).

stop() ->
    gen_server:cast(?MODULE, stop).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(get_state, _From, State) ->
    {reply, State#state.data, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({update_state, NewData}, State) ->
    NewState = State#state{data = NewData},
    {noreply, NewState};

handle_cast(stop, State) ->
    {stop, normal, State};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.