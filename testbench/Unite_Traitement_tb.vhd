library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Unite_Traitement_tb is
end entity;

Architecture test_bench of Unite_Traitement_tb is
	signal Reset,Clk,WE: std_logic;
	signal OP: std_logic_vector(1 downto 0);
	signal RW,RA,RB: std_logic_vector(3 downto 0);
	signal S:  std_logic_vector(31 downto 0);
	
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
	--initialisation
	Reset <= '1';
	wait for 5 ns;
	Reset <= '0';
	wait for 5 ns;

	-- R(1) = R(15)
	WE <= '0';     --pas de l'ecriture au d�but
	RA <= "1111";  --busA = R(15)
	RW <= "0001";  --S=R(1)
	OP <= "11";    --S=busA;
	wait for 10 ns;
	WE <= '1';
	wait for 10 ns;

	--R(1) =R(1)+ R(15)
	WE <= '0';
	RA <= "0001";  --busA = R(1) 
	RB <= "1111";  --busB= R(15)
	OP <= "00";    --S = busA + busB
	wait for 10 ns;
	WE <= '1';
	wait for 10 ns;
	
	--R(2) = R(1) + R(15)
	WE <= '0';
	RW <= "0010"; -- S = R(2)
	wait for 10 ns;
	WE <= '1';
	wait for 10 ns; 
	
	--R(3) = R(1) - R(15)
	WE <= '0';
	RW <= "0011";  --S=R(3)
	OP <="10";     --S=busA-busB
	wait for 10 ns;
	WE <= '1';
	wait for 10 ns;
	
	--R(5) = R(7) - R(15)
	WE <= '0';
	RW <= "0101";  --S=R(5)
	RA <= "0111";  --busA=R(7)
	wait for 10 ns;
	WE <= '1';
	wait for 10 ns;

	wait;
	
end process;

UUT: entity work.Unite_Traitement port map(Reset=>Reset ,Clk=>Clk ,WE=>WE ,OP=>OP ,RW=>RW ,RA=>RA ,RB=>RB ,busW=>S);

end architecture;