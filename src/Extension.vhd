library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Extension is
generic (N: positive :=8);
port(	
  E:in std_logic_vector(N-1 downto 0);
	S: out std_logic_vector(31 downto 0));
end entity;

Architecture rtl of Extension is
begin
  
	S(N-2 downto 0) <= E(N-2 downto 0);        --La valeur de S et E en N-1eme bits a 1eme bits sont pareil
	S(31 downto N-1) <= (others => E(N-1));    --La valeur extension du S en 32eme bits a Neme bits egale celui du Neme bits de E
	
end architecture;