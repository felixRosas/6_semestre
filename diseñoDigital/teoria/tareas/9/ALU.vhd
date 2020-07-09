library ieee;
use ieee. std_logic_1164.all;
entity ALU is port(
	a,b: std_logic_vector(1 downto 0);
	selarith: in std_logic;
	cin: in std_logic;
	cout: out std_logic;
	
	sellogic: in std_logic_vector(1 downto 0);
	selAlu: in std_logic;
	salida: out std_logic_vector(1 downto 0)
);
end entity;
architecture arqalu of alu is
signal salsumarith, salsumlogic: std_logic_vector(1 downto 0);
begin
	u1: entity work.ejercicio3 (arqejer3) port map (a,b,selarith,cin,salsumarith,cout);
	u2: entity work.multOpBool (arqmultopbool) port map(a,b,sellogic,salsumlogic);
	
	with selAlu select
	salida <= 	salsumarith when '0',
					salsumlogic when '1',
					"00" when others;
	
end architecture;
