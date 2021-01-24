library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UGI is   --unite de gestion des instructions
port( 	
  Clk,Reset: in std_logic;
	offset: in std_logic_vector(23 downto 0);
	nPCsel: in std_logic;
	Instruction: out std_logic_vector(31 downto 0)
);
end entity;

architecture rtl of UGI is
	signal sExtender: std_logic_vector(31 downto 0);   --sortie de extension
	signal sCompte: std_logic_vector(31 downto 0);     --sortie de compteur
	signal sPC: std_logic_vector(31 downto 0);         --sortie de registre PC

begin

G1: entity work.extension generic map (N => 24)
	port map (E => offset, S => sExtender);

G2: entity work.CompteurPC port map( PC=> sPC, sExtender => sExtender, nPCsel => nPCsel, S => sCompte);
 
G3: entity work.registrePC port map (PCin => sCompte, Clk => Clk, Reset => Reset, PCout => sPC);

G4: entity work.instruction_memory port map (Clk=>Clk, Addr => sPC, Instruction => Instruction);

end architecture;
