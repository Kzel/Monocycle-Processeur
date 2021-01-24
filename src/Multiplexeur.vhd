library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Multiplexeur is
generic (N: positive :=32);
port(
	A,B: in std_logic_vector(N-1 downto 0);
	COM: in std_logic;       --commande de selection
	S: out std_logic_vector(N-1 downto 0));
end entity;

Architecture rtl of Multiplexeur is
	signal Y: std_logic_vector(N-1 downto 0);

begin 
  
process(A,B,COM)
begin
	if (COM='0') then 
		Y<=A;
	elsif(COM='1') then 	
		Y<=B;
	end if;
end process;

S<=Y;
end architecture;