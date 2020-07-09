library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;
entity rom is port
(
	bus_dir: in std_logic_vector(1 downto 0);
	cs: in std_logic;
	bus_datos: out std_logic_vector(6 downto 0)	
);
end rom;
architecture arqrom of rom is
	constant L0: std_logic_vector(6 downto 0):="0001000";--"1000000";
	constant L1: std_logic_vector(6 downto 0):="1000111";--"1111001";
	constant L2: std_logic_vector(6 downto 0):="0001110";--"0100100";
	constant L3: std_logic_vector(6 downto 0):="1000000";--"0110000";
	
	type memoria is array (3 downto 0) of std_logic_vector(6 downto 0);
	constant mem_rom:memoria:=(L3,L2,L1,L0);
	signal dato: std_logic_vector(6 downto 0);
begin
	prom: process(bus_dir)
	begin
		dato<=mem_rom(conv_integer(bus_dir));
	end process prom;
	
	pbuf: process(dato,cs)
	begin
		if(cs='1') then
			bus_datos<=dato;
		else
			bus_datos<=(others=>'Z');
		end if;
	end process pbuf;
end arqrom;