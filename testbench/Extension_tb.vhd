library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Extension_tb is
end  entity;

Architecture testbench of Extension_tb is 
  signal E: std_logic_vector(7 downto 0);
	signal S: std_logic_vector(31 downto 0);

begin
  
simulate:process
begin
  E <= "00000000";
  wait for 5 ns;
  E <= "00000010";
  wait for 5 ns;
  E <= "10000100";
  wait for 5 ns;
  wait;
end process;

UUT:Entity work.Extension port map(E=>E ,S=>S);
end architecture;