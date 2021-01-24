Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Monocycle_tb is
end Entity;

Architecture test_bench of Monocycle_tb is
  signal Clk,Reset: std_logic;
  

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
  Reset <= '1';
  wait for 5 ns;
  Reset<= '0';
  wait for 5 ns;
 
  wait;
end process;
  
UUT:entity work.Monocycle port map(Clk=>Clk ,Reset=>Reset);
  
end Architecture;