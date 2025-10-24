with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random;

procedure Parallel_Messages is
   package Random renames Ada.Numerics.Float_Random;
   
   -- 定义一个任务类型
   task type Message_Task is
      entry Start(Msg: String);
   end Message_Task;
   
   -- 任务的具体实现
   task body Message_Task is
      My_Message : String(1..100);
      Msg_Length : Natural;
      Delay_Time : Duration;
   begin
      accept Start(Msg: String) do
         My_Message(1..Msg'Length) := Msg;
         Msg_Length := Msg'Length;
      end Start;
      
      -- 生成随机延迟，使任务执行时间不同
      Delay_Time := Duration(Random.Gen) * 2.0; -- 最多延迟2秒
      delay Delay_Time;
      
      Put_Line("Task executing: " & My_Message(1..Msg_Length));
      
      -- 额外的消息显示任务执行完成
      Put_Line("Task completed after " & Duration'Image(Delay_Time) & " seconds");
   end Message_Task;
   
   -- 声明一些任务实例
   Task1 : Message_Task;
   Task2 : Message_Task;
   Task3 : Message_Task;
   Task4 : Message_Task;
   Task5 : Message_Task;
   
   -- 随机数生成器
   Gen : Random.Generator;

begin
   Random.Reset(Gen);
   
   -- 启动任务并发送消息
   Task1.Start("Hello from Task 1!");
   Task2.Start("Greetings from Task 2!");
   Task3.Start("Message from Task 3!");
   Task4.Start("Task 4 says hi!");
   Task5.Start("Final message from Task 5!");
   
   Put_Line("All tasks started, waiting for completion...");
   
   -- 主程序等待一段时间，确保所有任务完成
   delay 3.0;
   
   Put_Line("Main procedure ending.");
end Parallel_Messages;