with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Parallel_Tasks is
   -- Define a task type for printing messages
   task type Printer_Task (ID : Integer);
   
   -- Implementation of the task
   task body Printer_Task is
      subtype Message_Range is Integer range 1..5;
      package Rand is new Ada.Numerics.Discrete_Random (Message_Range);
      Gen : Rand.Generator;
      Message_Count : Integer := 5;
   begin
      Rand.Reset(Gen);
      for I in 1..Message_Count loop
         Put_Line("Task" & Integer'Image(ID) & " - Message" & Integer'Image(I));
         -- Small delay to allow other tasks to run
         delay 0.1;
      end loop;
      Put_Line("Task" & Integer'Image(ID) & " completed.");
   end Printer_Task;

   -- Create several tasks
   Task1 : Printer_Task (1);
   Task2 : Printer_Task (2);
   Task3 : Printer_Task (3);
   Task4 : Printer_Task (4);

begin
   Put_Line("Main program waiting for tasks to complete...");
   
   -- The main program waits for all tasks to complete
   null; -- All tasks will complete before the program ends
   
   Put_Line("All tasks completed. Program terminating.");
end Parallel_Tasks;