with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Demo_Random is
   task type Worker_Task (ID : Integer);
   type Task_Access is access Worker_Task;

   task body Worker_Task is
   begin
      for I in 1..4 loop
         Put_Line("Worker Task" & Integer'Image(ID) & " - Message " & Integer'Image(I));
         delay 0.5;
      end loop;
   end Worker_Task;

   W1 : Worker_Task (1);
   W2 : Worker_Task (2);
   W3 : Worker_Task (3);

begin
   Put_Line("Random task demonstration started");
   delay 3.0;
   Put_Line("Random task demonstration completed");
end Task_Demo_Random;