generic
   type Index is (<>);           -- Generic index type
   type Elem is private;      -- Generic element type
   type Arr is array (Index range <>) of Elem;

package BagP is

   type Bag(Max: Index) is limited private;

   procedure insert_one(B: in out Bag; E: in Elem);
   function extract_one(B: in out Bag) return Elem;
   procedure insert_multiple(B: in out Bag; A: Arr);
   function extract_multiple(B: in out Bag; Num: Positive) return Arr;
   function IsFull(B: Bag) return Boolean;
   function isEmpty(B: Bag) return Boolean;
   
   
   generic
      with procedure Process_Element(Item: in Elem);
   procedure Print(B: in Bag);
   
private
   
   type Bag(Max: Index) is record
      Data: Arr(Index'First..Max);           -- Corrected: No range here
      Top: Index := Index'First;  -- 1 indicates Bag is Empty
      Size: Natural := 0;
   end record;
   

end BagP;
