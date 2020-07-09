library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;

entity rom is 
port(
	bus_dir: in std_logic_vector(1 downto 0);
	cs: in std_logic;
	bus_datos: out std_logic_vector(6 downto 0)
);
end entity;

architecture arqROM of rom is 
--constant LH: std_logic_vector(6 downto 0):= "0001001";
--constant LO: std_logic_vector(6 downto 0):= "1000000";
--constant LL: std_logic_vector(6 downto 0):= "1000111";
--constant LA: std_logic_vector(6 downto 0):= "0001000";
-- Mis iniciales ALF0 
constant LA: std_logic_vector(6 downto 0):= "0001000";
constant LL: std_logic_vector(6 downto 0):= "1000111";
constant LF: std_logic_vector(6 downto 0):= "0001110";
constant LO: std_logic_vector(6 downto 0):= "1000000";

type memoria is array (3 downto 0) of std_logic_vector(6 downto 0);
--constant mem_rom: memoria:=(LA,LL,LO,LH);
constant mem_rom: memoria:=(LO,LF,LL,LA);
signal dato: std_logic_vector(6 downto 0);

begin
	
	prom: process(bus_dir)
	begin
		dato <= mem_rom(conv_integer(bus_dir));
	end process prom;

	pbuf: process(dato,cs)
	begin
		if(cs='1') then
			bus_datos<=dato;
		else 	
			bus_datos<=(others=>'Z');--Significa alta impedancia
		end if;
	end process pbuf;
end architecture; 








