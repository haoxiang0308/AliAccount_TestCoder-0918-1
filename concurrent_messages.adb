with Ada.Text_IO; use Ada.Text_IO;

procedure Concurrent_Messages is
   task Printer_1;
   task Printer_2;
   task Printer_3;

   task body Printer_1 is
   begin
      for I in 1..3 loop
         Put_Line("Printer Task 1 - Message " & Integer'Image(I));
         delay 0.8;
      end loop;
   end Printer_1;

   task body Printer_2 is
   begin
      for I in 1..3 loop
         Put_Line("Printer Task 2 - Message " & Integer'Image(I));
         delay 1.0;
      end loop;
   end Printer_2;

   task body Printer_3 is
   begin
      for I in 1..3 loop
         Put_Line("Printer Task 3 - Message " & Integer'Image(I));
         delay 0.6;
      end loop;
   end Printer_3;

begin
   Put_Line("Starting concurrent message printing...");
   delay 4.0;
   Put_Line("All tasks completed.");
end Concurrent_Messages;