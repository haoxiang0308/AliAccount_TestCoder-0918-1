with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure task_parallel_98765 is

   task Printer_1;
   task Printer_2;
   task Printer_3;

   task body Printer_1 is
   begin
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task 1: Message " & Integer'Image(I));
      end loop;
   end Printer_1;

   task body Printer_2 is
   begin
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task 2: Message " & Integer'Image(I));
      end loop;
   end Printer_2;

   task body Printer_3 is
   begin
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task 3: Message " & Integer'Image(I));
      end loop;
   end Printer_3;

begin
   Ada.Text_IO.Put_Line("Main program: Starting tasks...");
   -- Tasks run concurrently until they complete their loops
   Ada.Text_IO.Put_Line("Main program: All tasks completed.");
end task_parallel_98765;