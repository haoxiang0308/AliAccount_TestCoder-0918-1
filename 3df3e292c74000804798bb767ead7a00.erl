-module('3df3e292c74000804798bb767ead7a00').
-behaviour(gen_server).

%% API
-export([start_link/0, init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-record(state, {counter = 0}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%%====================================================================
%% gen_server callbacks
%%====================================================================

init([]) ->
    {ok, #state{}}.

handle_call(increment, _From, State = #state{counter = Counter}) ->
    NewCounter = Counter + 1,
    {reply, NewCounter, State#state{counter = NewCounter}};
handle_call(decrement, _From, State = #state{counter = Counter}) ->
    NewCounter = Counter - 1,
    {reply, NewCounter, State#state{counter = NewCounter}};
handle_call(get_counter, _From, State = #state{counter = Counter}) ->
    {reply, Counter, State};
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