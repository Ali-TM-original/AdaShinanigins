with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Elections is

   function GetCountryName(E:Election) return String is
   begin
      return To_String(E.Country);
   end GetCountryName;
   
   function GetVotes(E: Election) return Integer is
   begin
      return E.TotalVotes;
   end GetVotes;
   
   function GetSeats(E: Election) return Integer is
   begin
      return E.TotalSeats;
   end GetSeats;
   
   procedure AddParties(E: in out Election; NewParties: Arr) is
      Count: Integer := 0;
      -- or we can do Count: Index := Index'First;
   begin
      for I in NewParties'Range loop
         if Count < E.Parties'Length then
            E.Parties(I) := NewParties(I);
            E.DataLength := Index'Succ(E.DataLength); -- increase length
         else
            Put_Line("Length Exceeded Could Not Add Party");
         end if;
         Count:= Count + 1;
      end loop;
   end AddParties;
   
   procedure CreateElection(E: in out Election; Name: String) is
      ub: Unbounded_String := To_Unbounded_String(Name);
   begin
      E.Country := ub;
   end CreateElection;
   
   procedure PrettyPrint(E: Election) is
   begin
      Put_Line("{");
      Put_Line("    Country: " & To_String(E.Country));
      Put_Line("    Total_Votes: "& Integer'Image(E.TotalVotes));
      Put_Line("    Total_Seats: "& Integer'Image(E.TotalSeats));
      Put_Line("}");
   end PrettyPrint;

   procedure TotalVotes(E: in out Election) is
      total: Integer := 0;
      el: Elem;
   begin
      for I in Index'First..Index'Pred(E.DataLength) loop
         el := E.Parties(I);
         ProcessVotes(el, total);
      end loop;
      E.TotalVotes := total;
   end TotalVotes;
    
   procedure setAllSeats(E: in out Election) is
      ele: Elem;
      ttl: Integer := E.TotalVotes;
   begin
      for I in Index'First..Index'Pred(E.DataLength) loop
         ele := E.Parties(I);
         ele := ProcessIndividualSeats(ele, ttl, E.TotalSeats);
         E.Parties(I) := ele;
      end loop;
   end setAllSeats;
   
   procedure PrintWinner(E: Election) is
   begin
      ProcessGreatestSeats(E.Parties, E.DataLength);
   end PrintWinner;

end Elections;
