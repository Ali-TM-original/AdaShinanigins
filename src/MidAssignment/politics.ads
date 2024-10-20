with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Politics is
   type PoliticalParty is private; -- Comment to test
   type Political_Party_N is (IFP, EFF, MK, DA, ANC);
   type Province is (Northen_Cape, Free_State, North_West, Mpumalanga, Limpopo,
Eastern_Cape, Western_Cape, KwaZulu_Natal, Gauteng);
   for Province use (1,2,3,4,5,6,7,8,9);
   
   -- Getters
   function GetPartyName(P: PoliticalParty) return Political_Party_N;
   function GetStrongHold(P: PoliticalParty) return Province;
   function GetLeaderName(P: PoliticalParty) return String;
   function GetVotes(P: PoliticalParty) return Integer;
   function GetSeats(P: PoliticalParty) return Integer;
   function GetProvincalValue(P: PoliticalParty) return Positive;
   
   -- Setters
   procedure SetSeats(P: in out PoliticalParty; S: Integer);
   
   -- Pretty Print
   procedure PrettyPrint(P: PoliticalParty);
   
   -- Constructor
   procedure CreateParty(P: in out PoliticalParty; Party: Political_Party_N; StrongHold: Province; Leader: String; Votes: Integer);
   
private
   type PoliticalParty is record
      PartyName: Political_Party_N;
      Stronghold: Province;
      NameOfLeader: Unbounded_String;
      Votes: Integer;
      Seats: Integer := 0;
   end record;
     
      
end Politics;
