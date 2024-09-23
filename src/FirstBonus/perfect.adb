with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Text_IO;
use Ada.Text_IO;

package body perfect is

   -- Function to check if a number is perfect
   function isPerfect(Num: Integer) return Boolean is
      Sum : Integer := 0;  -- Declare and initialize Sum to 0
   begin
      for i in 1..Num - 1 loop -- Don't include the number itself
         if Num mod i = 0 then
            Sum := Sum + i;
         end if;
      end loop;
      return Sum = Num;      
   end isPerfect;
   
   -- Procedure to execute the task
   procedure run_task is
      N : Integer;  -- Declare N to hold user input
   begin
      -- Put outputs without \n
      -- Put_Line outputs with \n
      Put("Please Enter A Number: "); -- From Text_IO
      Get(N);
      
      -- Loop through numbers from 1 to N and check if they're perfect
      for i in 1..N loop
         if isPerfect(i) then
            Put_Line(Integer'Image(i) & " is a Perfect Number");
         end if;
      end loop;
   end run_task;
   
end perfect;
