Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Decodeur_tb is
end entity;

Architecture test_bench of Decodeur_tb is
  
  signal nPCsel: std_logic;   
  signal PSR: std_logic_vector(31 downto 0);  
  signal Instruction: std_logic_vector(31 downto 0); 
  signal RegWr: std_logic;
  signal RegSel: std_logic;
  signal ALUctr: std_logic_vector(1 downto 0);
  signal ALUsrc: std_logic;
  signal PSREn: std_logic;
  signal MemWr: std_logic;
  signal WrSrc: std_logic;
  signal Rn,Rd,Rm: std_logic_vector(3 downto 0);
  signal Offset: std_logic_vector(23 downto 0);
  signal Imm: std_logic_vector(7 downto 0);
  
begin

simulate: process
begin
   PSR <= "00000000000000000000000000010000";
   Instruction <= "11100010100000000011011000000000";   --instr_courant=ADDi
   wait for 5 ns;
   PSR <= "00000000000000000000010000010000";
   Instruction <= "11100000100000000111100000000000";   --instr_courant=ADDr
   wait for 5 ns;
   PSR <= "00000000000000000000010000011000";
   Instruction <= "11101010000000000000000100000000";   --instr_courant=BAL
   wait for 5 ns;
   PSR <= "00000000000000000000010000011010";
   Instruction <= "10111010000000000011000010100000";   --instr_courant=BLT
   wait for 5 ns;
   PSR <= "00000000000000000000000000011010";
   Instruction <= "11100011010101100010000000000010";   --instr_courant=CMP
   wait for 5 ns; 
   PSR <= "00000000000000000000000000001010"; 
   Instruction <= "11100110000100000000000000000100";   --instr_courant=LDR
   wait for 5 ns;
   PSR <= "00000000000000000000010000010000";
   Instruction <= "11100011101000000010100000010000";   --instr_courant=MOV
   wait for 5 ns;
   PSR <= "00000000000000000000010000000000";
   Instruction <= "11100110000010000000000000000000";   --instr_courant=STR
   wait for 5 ns;    

  wait;
end process;

UUT:entity work.Decodeur port map(nPCsel=>nPCsel ,PSR=>PSR ,Instruction=>Instruction ,RegWr=>RegWr ,RegSel=>RegSel ,
                                  ALUctr=>ALUctr ,ALUsrc=>ALUsrc ,PSREn=>PSREn ,MemWr=>MemWr ,WrSrc=>WrSrc ,
                                  Rn=>Rn ,Rd=>Rd ,Rm=>Rm ,Offset=>Offset ,Imm=>Imm);
  
  
end Architecture;
  
