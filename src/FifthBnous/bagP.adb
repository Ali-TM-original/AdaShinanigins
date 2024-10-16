with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

package body BagP is
   
   procedure Print(B: in Bag) is
   begin
      if isEmpty(B) then
         return;
      end if;
      for I in Index'First .. Index'Pred(B.Top) loop
         Process_Element(B.Data(I));
      end loop;
   end Print;
   -- Index'Succ(B.Top mod B.Max) -- use this when popping
   
   procedure insert_one(B: in out Bag; E: in Elem) is
   begin
      -- Increases value of Top Pointer and Adds an Element there
      if IsFull(B) = False then
         B.Data(B.Top) := E;
         B.Size := b.Size + 1;
         B.Top := Index'Succ(B.Top);
      end if;
   end insert_one;
   --  
   procedure insert_multiple(B: in out Bag; A: Arr) is
   begin
      for I in A'Range loop
         insert_one(B, A(I));
      end loop;
   end insert_multiple;
   --  
   function extract_multiple(B: in out Bag; Num: Positive) return Arr is
      Temp_Num: Index := Index'Val(Num);  -- Safely convert Num to Index, assuming Num fits Index range
      temp: Arr(Index'First .. Temp_Num); -- Create array based on Index range
   begin
      -- Return Something with garbage values
      if isEmpty(B) then
         return temp;
      end if;
   
      for I in Index'First .. Temp_Num loop
         temp(I) := extract_one(B);
      end loop;
      return temp;
   
   end extract_multiple;
   --  
   --  
   function extract_one(B: in out Bag) return Elem is
      temp: Elem;
   begin
      if isEmpty(B) /= True then
         B.Top := Index'Pred(B.Top);
         temp := B.Data(B.Top);
         B.Size := B.Size - 1;
         return temp;
      else
         return temp;
      end if;
   end extract_one;
   

   
   function IsFull(B: Bag) return Boolean is
   begin
      return B.Top = B.Max;
   end IsFull;
   --  
   function isEmpty(B: Bag) return Boolean is
   begin
      return B.Size = 0;
   end isEmpty;


end BagP;
