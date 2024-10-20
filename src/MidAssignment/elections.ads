with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Politics; use Politics;

generic
   type Index is (<>);
   type Elem is private;
   type Arr is array (Index range <>) of Elem;

package Elections is
   type Election(Max: Index) is limited private;
   
   -- 1. Getters
   function GetCountryName(E:Election) return String;
   function GetVotes(E: Election) return Integer;
   function GetSeats(E: Election) return Integer;
   
   -- 2. Add Parties
   procedure AddParties(E: in out Election; NewParties: Arr);
   
   -- 3. Print
   procedure PrettyPrint(E: in Election);
   
   -- 4. Creates Election With Name
   procedure CreateElection(E: in out Election; Name: String);
   
   -- 5. AllVotes
   generic
      with procedure ProcessVotes(E: in out Elem; Total: in out Integer);
   procedure TotalVotes(E: in out Election);
   
   -- 6. setSeats
   generic 
      with function ProcessIndividualSeats(E: in out Elem; Total: in Integer; Seats: in out Integer) return Elem;
   procedure setAllSeats(E: in out Election);
   
   -- 7. greatestSeats
   generic
      with procedure ProcessGreatestSeats(E: Arr; L: Index);
      procedure PrintWinner(E: Election);
   
private
   type Election(Max: Index) is record
      Country: Unbounded_String;
      Parties: Arr(Index'First..Max);
      TotalVotes: Integer := 0;
      TotalSeats: Integer := 0;
      DataLength: Index := Index'First;
   end record;
   
end Elections;
