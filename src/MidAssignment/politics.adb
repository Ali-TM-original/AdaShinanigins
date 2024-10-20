with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


package body Politics is

   function GetPartyName(P: PoliticalParty) return Political_Party_N is
   begin
      return P.PartyName;
   end GetPartyName;
   
   
   function GetStrongHold(P: PoliticalParty) return Province is
   begin
      return P.Stronghold;
   end GetStrongHold;
  
   function GetLeaderName(P: PoliticalParty) return String is
   begin
      -- Needs to be casted into String
      return To_String(P.NameOfLeader);
   end GetLeaderName;
   
   function GetVotes(P: PoliticalParty) return Integer is
   begin
      return P.Votes;
   end GetVotes;
   
   function GetSeats(P: PoliticalParty) return Integer is
   begin
      return P.Seats;
   end GetSeats;
   
   function GetProvincalValue(P: PoliticalParty) return Positive is
   begin
      return Province'Enum_Rep(P.Stronghold);
   end GetProvincalValue;
   
   procedure SetSeats(P: in out PoliticalParty; S: Integer) is
   begin
      P.Seats := S;
   end SetSeats;
   
   procedure PrettyPrint(P: PoliticalParty) is
   begin
      Put_Line("{");
      Put_Line("    Party_Name: " & Political_Party_N'Image(GetPartyName(P)));
      Put_Line("    Stronghold: " & Province'Image(GetStrongHold(P)));
      Put_Line("    Leader_Name: " & GetLeaderName(P));
      Put_Line("    Votes: " & Integer'Image(GetVotes(P)));
      Put_Line("    Parliamentary_Seats: " & Integer'Image(GetSeats(P)));
      Put_Line("},");
   end PrettyPrint;

   procedure CreateParty(P: in out PoliticalParty; Party: Political_Party_N; StrongHold: Province; Leader: String; Votes: Integer) is
   begin
      P.PartyName := Party;
      P.Stronghold := StrongHold;
      P.NameOfLeader := To_Unbounded_String(Leader);
      P.Votes := Votes;
   end CreateParty;
   
end Politics;
