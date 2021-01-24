library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UGI_tb is
end entity;

architecture test_bench of UGI_tb is
	signal Clk,Reset:std_logic;
	signal nPCsel: std_logic:='0';
	signal offset: std_logic_vector(23 downto 0);
	signal instruction: std_logic_vector(31 downto 0);
	
begin
  
ClockGenerator: process
	begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
end process;

simulate: process
begin
	Reset <= '1';    --initialisation
	wait for 10 ns;
	Reset <= '0';
	wait for 10 ns;
	offset <= "000000000000000000000011";    --offset=3
	nPCsel <= '1';                           --Instruction=mem(5)
	wait for 10 ns;
	nPCsel <= '0';     --Instruction=mem(6)
	wait for 10 ns;
	nPCsel <= '1';     --Instruction=mem(10)
	wait for 10 ns;
	wait;
end process;

UUT: entity work.UGI	port map (Clk=>Clk ,Reset=>Reset ,offset=>offset ,nPCsel=>nPCsel ,Instruction=>Instruction);

end architecture;