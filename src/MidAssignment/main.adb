with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Politics; use Politics;
with Elections;

procedure Main is
   -- Part 1
   P: Politics.PoliticalParty;

   -- Part 2 shit
   type Elem is new Politics.PoliticalParty;
   type Index is new Positive;
   type Arr is array(Index range <>) of Elem;

   package AwesomeElection is new Elections(Index, Elem, Arr);
   use AwesomeElection;

   procedure getGenericVotes(E: in out Elem; Total: in out Integer) is
   begin
      Total := Total + Politics.GetVotes(PoliticalParty(E));
   end getGenericVotes;

   function ProcessIndividualSeats(E: in out Elem; Total: in Integer; Seats: in out Integer) return Elem is
      val: Integer := GetProvincalValue(E);
   begin

      Seats := Seats + Integer( Integer((GetVotes(E) / Total) * 450) + val);
      SetSeats(E, Integer( Integer((GetVotes(E) / Total) * 450) + val));
      PrettyPrint(E);
      return E; -- for some reason without returning it was not working
   end ProcessIndividualSeats;

   procedure ProcessGreatestSeats(A: Arr; L: Index) is
      first: Elem := A(Index'First);
      Max: Integer := GetSeats(first);
   begin
      for I in Index'Succ(Index'First)..Index'Pred(L) loop
         if GetSeats(A(I)) > Max then
            Max := GetSeats(A(I));
            first := A(I);
         end if;
      end loop;
      Put_Line("Party Name: " & Political_Party_N'Image(GetPartyName(first)));
      Put_Line("Party Leader: " & GetLeaderName(first));
      Put_Line("Seats: " & Integer'Image(GetSeats(first)));
   end ProcessGreatestSeats;

   procedure setTotalVotes is new AwesomeElection.TotalVotes(getGenericVotes);
   procedure setAllSeats is new AwesomeElection.setAllSeats(ProcessIndividualSeats);
   procedure PrintWinner is new AwesomeElection.PrintWinner(ProcessGreatestSeats);


   Max: Index := Index'First + 6;
   MyElection: Election(Max);
   p1: PoliticalParty;
   p2: PoliticalParty;
   p3: PoliticalParty;
   p4: PoliticalParty;
   temp_arr: Arr(1..4);

begin
   -- Part 1
   --Politics.CreateParty(P, Politics.IFP, Politics.Northen_Cape,"Ali", 10);
   --Politics.PrettyPrint(P);
   --Politics.SetSeats(P,50);
   --Politics.PrettyPrint(P);

   -- Part 2 Generics

   -- This part is to test the add function
   CreateParty(p1, Politics.IFP, Politics.Gauteng,"Ali", 1);
   CreateParty(p2, Politics.EFF, Politics.Free_State,"Billi", 2);
   CreateParty(p3, Politics.MK, Politics.Limpopo,"Abd", 3);
   CreateParty(p4, Politics.ANC, Politics.Gauteng,"Ahmed", 4);
   temp_arr:= (Elem(p1),Elem(p2),Elem(p3),Elem(p4));
   -- Ended tests for add function

   CreateElection(MyElection, "Pakistani Election");
   Put_Line(GetCountryName(MyElection));
   AddParties(MyElection, temp_arr); -- Added 4 parties
   PrettyPrint(MyElection);
   setTotalVotes(MyElection); -- should be 24
   PrettyPrint(MyElection);
   setAllSeats(MyElection); -- Sets Seats of all Parties
   PrettyPrint(MyElection);
   PrintWinner(MyElection);
end Main;
