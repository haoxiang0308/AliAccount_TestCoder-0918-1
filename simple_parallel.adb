with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Calendar;
with Ada.Integer_Text_IO;

procedure Simple_Parallel is
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
   subtype FileNameRange is Integer range 1..1000000;
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
      Random_Str: constant String := Integer'Image(Random_Num);
      Trimmed_Str: String := Random_Str;
   begin
      -- 去除前导空格
      for I in Random_Str'Range loop
         if Random_Str(I) /= ' ' then
            Trimmed_Str := Random_Str(I..Random_Str'Last);
            exit;
         end if;
      end loop;
      
      declare
         Final_File_Name : String := Trimmed_Str & ".adb";
      begin
         Put_Line("Generated random file name: " & Final_File_Name);
         
         -- 创建一个随机命名的文件，其中包含另一个Ada程序
         declare
            Output_File: File_Type;
         begin
            Create(Output_File, Out_File, Final_File_Name);
            Put_Line(Output_File, "with Ada.Text_IO; use Ada.Text_IO;");
            Put_Line(Output_File, "");
            Put_Line(Output_File, "procedure " & 
                     Trimmed_Str & " is");
            Put_Line(Output_File, "begin");
            Put_Line(Output_File, "   Put_Line(\"This is a randomly named Ada file!\");");
            Put_Line(Output_File, "   Put_Line(""File name: " & Final_File_Name & """);");
            Put_Line(Output_File, "end " & Trimmed_Str & ";");
            Close(Output_File);
            Put_Line("Random .adb file created successfully!");
         end;
      end;
   end;

   Put_Line("All tasks started");
   
   -- 稍作延迟以确保任务完成
   delay 2.0;
   
   Put_Line("Program completed");
end Simple_Parallel;