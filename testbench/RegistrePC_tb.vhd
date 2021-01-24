library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegistrePC_tb is
end entity;

architecture test_bench of RegistrePC_tb is
  signal PCin: std_logic_vector (31 downto 0);
	signal Clk: std_logic;
	signal Reset: std_logic;                  --actif a l'etat haut
	signal PCout: std_logic_vector(31 downto 0);

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
  
  Reset <= '1';   --PCOut=0
  wait for 5 ns;
  Reset <= '0';
  wait for 5 ns;
  PCin <= Std_logic_vector(To_signed(10,32));   --PCOut=PCin=10
  wait for 10 ns;
  PCin <= Std_logic_vector(To_signed(100,32));    --PCOut=PCin=100
  wait for 10 ns;
  wait;
  
end process;

UUT:entity work.registrePC port map (PCin => PCin, Clk => Clk, Reset => Reset, PCout => PCout);
end architecture;
  