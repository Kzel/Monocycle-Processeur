library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Multiplexeur_tb is
end entity;

Architecture test_bench of Multiplexeur_tb is
  signal A,B: std_logic_vector(31 downto 0);
	signal COM: std_logic;       --commande de selection
	signal S: std_logic_vector(31 downto 0);
	
begin
simulate:process
begin
  A <=  Std_logic_vector(To_signed(104,32));
  B <= Std_logic_vector(To_signed(200,32));
  COM <= '0';       --S=A
  wait for 5 ns;
  COM <= '1';       --S=B
  wait for 5 ns;
  wait;

end  process;

UUT:entity work.Multiplexeur generic map(N=>32) port map(A=>A ,B=>B ,COM=>COM,S=>S);
end architecture;  