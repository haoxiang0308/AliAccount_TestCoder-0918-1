with Ada.Text_IO;
with Ada.Task_Identification;

procedure Task_Parallel_Demo is
   task type Printer_Task;
   task body Printer_Task is
      Task_Id : Ada.Task_Identification.Task_Id;
   begin
      Task_Id := Ada.Task_Identification.Current_Task;
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task " & Ada.Task_Identification.Image(Task_Id) & " - Message " & Integer'Image(I));
         delay 0.1;  -- 短暂延迟以观察并行性
      end loop;
   end Printer_Task;

   Task1 : Printer_Task;
   Task2 : Printer_Task;
   Task3 : Printer_Task;
begin
   Ada.Text_IO.Put_Line("Starting parallel tasks...");
   null; -- 任务将在后台运行
end Task_Parallel_Demo;