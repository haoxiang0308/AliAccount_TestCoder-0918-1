with Ada.Text_IO;
with Ada.Task_Identification;
with Ada.Numerics.Float_Random;

procedure Parallel_Tasks is
   package TIO renames Ada.Text_IO;
   package Rand renames Ada.Numerics.Float_Random;
   
   task type Worker_Task;
   type Worker_Access is access Worker_Task;
   
   task body Worker_Task is
      Seed: Rand.Generator;
      Task_Id: Integer := Integer(Ada.Task_Identification.Current_Task);
   begin
      Rand.Reset(Seed);
      TIO.Put_Line("Task " & Integer'Image(Task_Id mod 1000) & " is starting.");
      
      for I in 1..3 loop
         declare
            Delay_Time: Float := Rand.Random(Seed) * 0.5; -- Random delay between 0 and 0.5 seconds
         begin
            TIO.Put_Line("Task " & Integer'Image(Task_Id mod 1000) & " - Message " & Integer'Image(I));
            delay Duration(Delay_Time);
         end;
      end loop;
      
      TIO.Put_Line("Task " & Integer'Image(Task_Id mod 1000) & " is terminating.");
   end Worker_Task;
   
   -- Create multiple tasks
   Task1: aliased Worker_Task;
   Task2: aliased Worker_Task;
   Task3: aliased Worker_Task;

begin
   TIO.Put_Line("Main program started.");
   delay 2.0; -- Wait for tasks to complete
   TIO.Put_Line("Main program ending.");
end Parallel_Tasks;