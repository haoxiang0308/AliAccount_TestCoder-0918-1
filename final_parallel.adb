with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Calendar;
with Ada.Integer_Text_IO;

procedure Final_Parallel is
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
      Final_File_Name : String(1..20);
      Actual_Length : Natural := 0;
   begin
      -- 去除前导空格
      for I in Random_Str'Range loop
         if Random_Str(I) /= ' ' then
            Trimmed_Str := Random_Str(I..Random_Str'Last);
            exit;
         end if;
      end loop;
      
      -- 构建文件名
      for I in Trimmed_Str'Range loop
         if Trimmed_Str(I) /= ' ' and Actual_Length < Final_File_Name'Length-4 then
            Actual_Length := Actual_Length + 1;
            Final_File_Name(Actual_Length) := Trimmed_Str(I);
         else
            exit;
         end if;
      end loop;
      
      -- 添加.adb扩展名
      Final_File_Name(Actual_Length+1) := '.';
      Final_File_Name(Actual_Length+2) := 'a';
      Final_File_Name(Actual_Length+3) := 'd';
      Final_File_Name(Actual_Length+4) := 'b';
      Actual_Length := Actual_Length + 4;
      
      declare
         Filename: String := Final_File_Name(1..Actual_Length);
      begin
         Put_Line("Generated random file name: " & Filename);
         
         -- 创建一个随机命名的文件，其中包含另一个Ada程序
         declare
            Output_File: File_Type;
         begin
            Create(Output_File, Out_File, Filename);
            Put_Line(Output_File, "with Ada.Text_IO; use Ada.Text_IO;");
            Put_Line(Output_File, "");
            Put_Line(Output_File, "procedure RandomFile is");
            Put_Line(Output_File, "begin");
            Put_Line(Output_File, "   Put_Line(""This is a randomly named Ada file!"");");
            Put_Line(Output_File, "   Put_Line(""File name: " & Filename & """);");
            Put_Line(Output_File, "end RandomFile;");
            Close(Output_File);
            Put_Line("Random .adb file created successfully!");
         end;
      end;
   end;

   Put_Line("All tasks started");
   
   -- 稍作延迟以确保任务完成
   delay 2.0;
   
   Put_Line("Program completed");
end Final_Parallel;