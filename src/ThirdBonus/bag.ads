package Bag is

   type Bag is limited private;
   type TempBag is array (Positive range <>) of Integer;

   procedure Print(B: in Bag);
   procedure insert_one(B: in out Bag; E: in Integer);
   function extract_one(B: in out Bag) return Integer;
   procedure insert_multiple(B: in out Bag; Arr: TempBag);
   function extract_multiple(B: in out Bag; Num: Positive) return TempBag;

private

   type Arr is array (1 .. 100) of Integer;

   type Bag is record
      Data: Arr;           -- Corrected: No range here
      Top: Positive := 1;  -- 1 indicates Bag is Empty
   end record;

   function IsFull(B: Bag) return Boolean;
   function isEmpty(B: Bag) return Boolean;

end Bag;
