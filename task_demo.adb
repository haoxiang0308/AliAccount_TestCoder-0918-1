with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Demo is
   -- Define a task type for printing messages
   task type Message_Task (Task_ID : Integer);

   -- A procedure to print messages
   procedure Print_Message(Msg : in String; Task_ID : in Integer);
   
   procedure Print_Message(Msg : in String; Task_ID : in Integer) is
   begin
      for I in 1 .. 3 loop
         Put_Line("Task" & Integer'Image(Task_ID) & " - " & Msg & " #" & Integer'Image(I));
         delay 0.2; -- Small delay to demonstrate parallel execution
      end loop;
      Put_Line("Task" & Integer'Image(Task_ID) & " has finished.");
   end Print_Message;

   -- Implementation of the task
   task body Message_Task is
   begin
      case Task_ID is
         when 1 => 
            Print_Message("Hello from Task 1", Task_ID);
         when 2 => 
            Print_Message("Greetings from Task 2", Task_ID);
         when 3 => 
            Print_Message("Hi from Task 3", Task_ID);
         when 4 => 
            Print_Message("Message from Task 4", Task_ID);
         when others =>
            Print_Message("Generic Task", Task_ID);
      end case;
   end Message_Task;

   -- Create several tasks that will run in parallel
   T1 : Message_Task (1);
   T2 : Message_Task (2);
   T3 : Message_Task (3);
   T4 : Message_Task (4);

begin
   Put_Line("Main program started. Tasks are running in parallel...");
   delay 1.0; -- Wait a bit before main program continues
   Put_Line("Main program continuing...");
   delay 2.0; -- Wait for tasks to complete
   Put_Line("Main program ending.");
end Task_Demo;