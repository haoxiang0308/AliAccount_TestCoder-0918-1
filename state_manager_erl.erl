-module(state_manager_erl).
-behaviour(gen_server).

%% API
-export([start_link/0, get_state/0, set_state/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {data = undefined}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

get_state() ->
    gen_server:call(?SERVER, get_state).

set_state(Data) ->
    gen_server:cast(?SERVER, {set_state, Data}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(get_state, _From, State = #state{data = Data}) ->
    {reply, Data, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({set_state, Data}, _State) ->
    {noreply, #state{data = Data}};

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================