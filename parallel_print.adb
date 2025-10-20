with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Parallel_Print is
   -- 定义任务类型
   task type Print_Task is
      entry Start(Id: in Integer);
   end Print_Task;

   -- 任务实现
   task body Print_Task is
      My_Id: Integer;
   begin
      accept Start(Id: in Integer) do
         My_Id := Id;
      end Start;
      
      -- 打印消息
      for I in 1..3 loop
         Put_Line("Task" & Integer'Image(My_Id) & " - Message" & Integer'Image(I));
         delay 0.1; -- 短暂延迟以显示并行性
      end loop;
   end Print_Task;

   -- 声明任务实例
   T1: Print_Task;
   T2: Print_Task;
   T3: Print_Task;

   -- 用于生成随机文件名的包
   subtype FileNameRange is Integer range 1..1000000;
   package RandomNumber is new Ada.Numerics.Discrete_Random(FileNameRange);
   Gen: RandomNumber.Generator;

begin
   RandomNumber.Reset(Gen);
   
   -- 启动任务
   T1.Start(1);
   T2.Start(2);
   T3.Start(3);
   
   Put_Line("All tasks started");
   
   -- 等待任务完成（实际上任务会自动完成）
   delay 2.0;
   
   Put_Line("Program completed");
end Parallel_Print;