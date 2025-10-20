-module(simple_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    % 定义子进程规格
    ChildSpecs = [
        {
            simple_worker,  % 子进程ID
            {simple_worker, start_link, []},  % 启动函数
            permanent,      % 重启策略
            5000,          % 关闭时间
            worker,        % 进程类型
            [simple_worker] % 需要的模块
        }
    ],
    % 监督策略
    SupFlags = {
        one_for_one,  % 重启策略
        5,            % 最大重启次数
        60            % 时间窗口（秒）
    },
    {ok, {SupFlags, ChildSpecs}}.