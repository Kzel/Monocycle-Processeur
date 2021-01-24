library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--test bench pour Banc registre
Entity BancRegistre_tb is    
end entity;

Architecture testbench of BancRegistre_tb is
  signal CLK: std_logic;
  signal W: std_logic_vector(31 downto 0);  	--bus de données
	signal RA: std_logic_vector(3 downto 0);			--bus d'adresse en lecture du port A
	signal RB: std_logic_vector(3 downto 0);			--bus d'adresse en lecture du port B
	signal RW: std_logic_vector(3 downto 0);			--bus d'adresse en écriture 
	signal WE: std_logic;
	signal A: std_logic_vector(31 downto 0);			--Bus de données en lecture du port A
	signal B: std_logic_vector(31 downto 0);			--Bus de données en lecture du port B
  
begin
  
Clock: process
	begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
end process;
  
simulate:process
begin
  W <= Std_logic_vector(To_signed(521,32));
  RA <= "0000";     --A=R(0)
  RB <= "1111";     --B=R(15)
  RW <= "0001";     --R(1)=W
  WE <= '0';
  wait for 5 ns;
  WE <= '1';
  wait for 5 ns;
  WE <= '0';
  RB <= "1110";     --B=R(14)
  wait for 5 ns;
  RW <= "0010";     --R(2)=W
  WE <= '1';
  wait for 5 ns;
  wait;
  
end process;

UUT: entity work.Banc_Registre port map(CLK=>CLK ,W=>W ,RA=>RA ,RB=>RB ,RW=>RW ,WE=>WE ,A=>A ,B=>B);
end architecture;
    