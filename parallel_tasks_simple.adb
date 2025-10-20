with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Parallel_Tasks_Simple is
   -- 定义任务类型用于并行打印
   task type Print_Task;
   
   -- 任务实现
   task body Print_Task is
   begin
      -- 打印消息
      for I in 1..3 loop
         Put_Line("Parallel Task - Message" & Integer'Image(I));
         delay 0.1; -- 短暂延迟以显示并行性
      end loop;
   end Print_Task;

   -- 随机数生成器用于创建随机文件名
   subtype FileNameRange is Integer range 1000..9999;
   package RandomNumber is new Ada.Numerics.Discrete_Random(FileNameRange);
   Gen: RandomNumber.Generator;
   
   Random_Num: Integer;

   -- 任务实例
   T1: Print_Task;
   T2: Print_Task;
   T3: Print_Task;

begin
   RandomNumber.Reset(Gen);
   Random_Num := RandomNumber.Random(Gen);
   
   -- 生成随机文件名
   declare
      Filename: constant String := "random_file_" & Integer'Image(Random_Num) & ".adb";
      Trimmed_Filename: String := Filename;
   begin
      -- 去除前导空格
      for I in Filename'Range loop
         if Filename(I) /= ' ' then
            Trimmed_Filename := Filename(I..Filename'Last);
            exit;
         end if;
      end loop;
      
      Put_Line("Generated random file name: " & Trimmed_Filename);
      
      -- 创建一个随机命名的文件，其中包含另一个Ada程序
      declare
         Output_File: File_Type;
      begin
         Create(Output_File, Out_File, Trimmed_Filename);
         Put_Line(Output_File, "with Ada.Text_IO; use Ada.Text_IO;");
         Put_Line(Output_File, "");
         Put_Line(Output_File, "procedure RandomFile is");
         Put_Line(Output_File, "begin");
         Put_Line(Output_File, "   Put_Line(""This is a randomly named Ada file!"");");
         Put_Line(Output_File, "   Put_Line(""File name: " & Trimmed_Filename & """);");
         Put_Line(Output_File, "end RandomFile;");
         Close(Output_File);
         Put_Line("Random .adb file created successfully!");
      end;
   end;

   Put_Line("All tasks started");
   
   -- 稍作延迟以确保任务完成
   delay 2.0;
   
   Put_Line("Program completed");
end Parallel_Tasks_Simple;