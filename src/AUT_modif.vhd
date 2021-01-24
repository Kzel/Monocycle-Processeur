library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity AUT_modif is --assembleur de unite de traitement apres la modification
port( 	
       Clk:in std_logic;
	     RegWr,RegSel:in std_logic;
	     Rn,Rd,Rm:in std_logic_vector(3 downto 0);
	     Imm:in std_logic_vector(7 downto 0);
	     COM1,COM2: in std_logic;
	     OP: in std_logic_vector(1 downto 0);
	     WrEn: in std_logic;
	     busW: inout std_logic_vector(31 downto 0);
	     flag: out std_logic			--N dans ALU
);
end entity;

Architecture rtl of AUT_modif is
	signal busA,busB:std_logic_vector(31 downto 0);
	signal ALUOut:std_logic_vector(31 downto 0);
	signal ExOut:std_logic_vector(31 downto 0);
	signal multiOut: std_logic_vector(31 downto 0);
	signal DataOut: std_logic_vector(31 downto 0);
	signal Rb: std_logic_vector(3 downto 0);

begin

G1:Entity work.Multiplexeur generic map(4) port map(A=>Rm ,B=>Rd ,COM=>RegSel,S=>Rb);
G2:Entity work.Banc_Registre port map(CLK=>Clk ,W=>busW ,RA=>Rn ,RB=>Rb ,Rw=>Rd ,WE=>RegWr ,A=>busA ,B=>busB);
G3:Entity work.Extension generic map(8) port map(E=>Imm ,S=>ExOut);
G4:Entity work.Multiplexeur generic map(32) port map(A=>busB ,B=>ExOut ,COM=>COM1,S=>multiOut);
G5:Entity work.ALU port map(OP=>OP ,A=>busA ,B=>multiOut ,S=>ALUOut ,N=>flag);
G6:Entity work.Memoir port map(Clk=>Clk ,DataIn=>busB ,DataOut=>DataOut ,Addr=>ALUOut(5 downto 0) ,WrEn=>WrEN);	
G7:Entity work.Multiplexeur generic map(32) port map(A=>ALUOut ,B=>DataOut ,COM=>COM2,S=>busW);

end Architecture;