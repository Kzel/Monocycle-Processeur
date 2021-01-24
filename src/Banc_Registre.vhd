Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Banc_Registre is
port(
	CLK:in std_logic;
	W: in std_logic_vector(31 downto 0);  	--bus de données
	RA: in std_logic_vector(3 downto 0);			--bus d'adresse en lecture du port A
	RB: in std_logic_vector(3 downto 0);			--bus d'adresse en lecture du port B
	RW: in std_logic_vector(3 downto 0);			--bus d'adresse en écriture 
	WE: in std_logic;                      --commande pour ecire dans le registre
	A: out std_logic_vector(31 downto 0);		--Bus de données en lecture du port A
	B: out std_logic_vector(31 downto 0)			--Bus de données en lecture du port B
);
end entity;

Architecture rtl of Banc_Registre is
  --definie un tableau de 16 lignes et chaque ligne contient 32 bits
	type table is array (0 to 15) of std_logic_vector(31 downto 0);
	
	--fonction d'initialiser du tableau
	function init_banc return table is
	
	variable result : table;

begin
 	for i in 14 downto 0 loop
		result(i):= (others => '0');
	end loop;

	result(15):= x"00000030";      --R(15)=48
	return result;
end init_banc;


signal Banc: table:= init_banc;

begin

	A <= Banc(to_integer(unsigned(RA)));   --A = La RAeme ligne du tableau
	B <= Banc(to_integer(unsigned(RB)));   --B = La RBeme ligne du tableau

process(CLK)
 begin
	if rising_edge(CLK) then
		if ( WE = '1' ) then
			Banc(to_integer(unsigned(RW)))<= W;      --On ecrit la valeur W dans RWeme ligne du tableau
		end if;
	end if;
end process;

end architecture;
