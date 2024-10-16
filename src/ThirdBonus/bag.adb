with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

package body Bag is
   
   procedure Print(B: in Bag) is
   begin
      if isEmpty(B) then
         return;
      end if;
      for I in 1..B.Top - 1 loop
         Put(B.Data(I));
      end loop;
   end Print;
   
   procedure insert_one(B: in out Bag; E: in Integer) is
   begin
      -- Increases value of Top Pointer and Adds an Element there
      if IsFull(B) = False then
         B.Data(B.Top) := E;
         B.Top := B.Top + 1;
      end if;
   end insert_one;
   
   procedure insert_multiple(B: in out Bag; Arr: TempBag) is
   begin
      for I in Arr'Range loop
         insert_one(B, Arr(I));
      end loop;
   end insert_multiple;
   
   function extract_multiple(B: in out Bag; Num: Positive) return TempBag is
      temp: TempBag(1..Num);
   begin
      if isEmpty(B) then
         for I in 1..Num loop
            temp(I) := -1;
         end loop;
         return temp;
      end if;
      
      for I in 1..Num loop
         temp(I) := extract_one(B);
      end loop;
      return temp;
      
   end extract_multiple;

   
   function extract_one(B: in out Bag) return Integer is
      temp: Integer;
   begin
      if isEmpty(B) /= True then
         B.Top := B.Top - 1;
         temp := B.Data(B.Top);
         return temp;
      else
         return -1;
      end if;
   end extract_one;
   

   
   function IsFull(B: Bag) return Boolean is
   begin
      return B.Top = 100;
   end IsFull;
     
   function isEmpty(B: Bag) return Boolean is
   begin
      return B.Top = 1;
   end isEmpty;


end Bag;
