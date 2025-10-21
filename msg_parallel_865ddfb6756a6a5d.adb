with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random;
with Ada.Calendar;

procedure msg_parallel_865ddfb6756a6a5d is
   task type Printer_Task;
   
   task body Printer_Task is
      Rnd : Ada.Numerics.Float_Random.Generator;
      Rand_Val : Float;
   begin
      Ada.Numerics.Float_Random.Reset(Rnd);
      Rand_Val := Ada.Numerics.Float_Random.Random(Rnd);
      delay Rand_Val; -- 随机延迟，使任务异步执行
      Put_Line("Hello from parallel task! Random value: " & Float'Image(Rand_Val));
   end Printer_Task;
   
   T1 : Printer_Task;
   T2 : Printer_Task;
   T3 : Printer_Task;
   
   Start_Time : Ada.Calendar.Time;
   Main_Rnd : Ada.Numerics.Float_Random.Generator;
   Rand_Val : Float;
   
begin
   Ada.Numerics.Float_Random.Reset(Main_Rnd);
   Start_Time := Ada.Calendar.Clock;
   Rand_Val := Ada.Numerics.Float_Random.Random(Main_Rnd);
   Put_Line("Main task started at time 0.0");
   Put_Line("Hello from main task! Random value: " & Float'Image(Rand_Val));
   
   -- 任务会自动开始执行
   delay 2.0; -- 等待所有任务完成
   
   Put_Line("All tasks completed.");
   Put_Line("Total execution time: " & Duration'Image(Ada.Calendar."-"(Ada.Calendar.Clock, Start_Time)) & " seconds");
end msg_parallel_865ddfb6756a6a5d;