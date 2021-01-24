library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CompteurPC_tb is
end entity;

architecture test_bench of CompteurPC_tb is
  signal PC,sExtender: std_logic_vector(31 downto 0);
	signal nPCsel: std_logic;          --commande de selection
	signal S: std_logic_vector(31 downto 0);

begin
  
simulate: process
begin

  PC <= Std_logic_vector(To_signed(10,32));
  sExtender <= Std_logic_vector(To_signed(4,32));
  nPCsel <= '0';    --S=PC+1=11
  wait for 5 ns;
  nPCsel <= '1';    --S=PC+1+offset=15
  wait for 5 ns;
  PC <= Std_logic_vector(To_signed(100,32));
  wait for 5 ns;    --S=PC+1+offset=105
  nPCsel <= '0';    --S=PC+1=101
  wait for 5 ns;
  wait;
  
end process;

UUT:entity work.CompteurPC port map( PC=> PC, sExtender => sExtender, nPCsel => nPCsel, S => S);
end architecture;
  