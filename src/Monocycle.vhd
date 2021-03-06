Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Monocycle is
port(
  Clk,Reset: in std_logic
  );
end Entity;

Architecture rtl of Monocycle is 
  signal Instruction: std_logic_vector(31 downto 0);
  signal nPCsel: std_logic;
  signal Rn,Rd,Rm: std_logic_vector(3 downto 0);
  signal RegWr,RegSel: std_logic;
  signal ALUsrc,WrSrc: std_logic;
  signal ALUctr: std_logic_vector(1 downto 0);
  signal PSREn: std_logic;
  signal MemWr: std_logic;
  signal N: std_logic;
  signal flag: std_logic_vector(31 downto 0);
  signal PSR: std_logic_vector(31 downto 0);
  signal busW: std_logic_vector(31 downto 0);
  signal Offset: std_logic_vector(23 downto 0);
  signal Imm: std_logic_vector(7 downto 0);

begin
  
G1: entity work.UGI port map(Clk=>Clk ,Reset=>Reset ,offset=>Offset ,nPCsel=>nPCsel ,Instruction=>Instruction);
G2: entity work.AUT_modif port map(Clk=>Clk ,RegWr=>RegWr ,RegSel=>RegSel ,Rn=>Rn ,Rd=>Rd ,Rm=>Rm ,Imm=>Imm ,
                             	     COM1=>ALUsrc ,COM2=>WrSrc ,OP=>ALUctr ,WrEn=>MemWr ,busW=>busW ,flag=>N);
                             	     
                             	     
flag <="0000000000000000000000000000000"&N;   --le poid faible de flag prend la valeur de N(signe)

G3: entity work.PSR port map(DataIn=>flag ,RST=>Reset ,CLK=>Clk ,WE=>PSREn ,DataOut=>PSR);
G4: entity work.Decodeur port map(nPCsel=>nPCsel ,PSR=>PSR ,Instruction=>Instruction ,RegWr=>RegWr ,RegSel=>RegSel , 
                                  ALUctr=>ALUctr ,ALUsrc=>ALUsrc ,PSREn=>PSREn ,MemWr=>MemWr ,WrSrc=>WrSrc ,Rn=>Rn ,
                                  Rd=>Rd ,Rm=>Rm ,Offset=>Offset ,Imm=>Imm);                           	     


end Architecture;

