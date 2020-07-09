library ieee;
use ieee.std_logic_1164.all;

entity project4 is 
port(
--clk: in std_logic;
sigSensor: in std_logic;	
edoLed: out std_logic
);
end project4;


architecture arqSensor of project4 is 
begin
	process(sigSensor)--,clk)
	begin
			if (sigSensor='1') then 
				edoLed <= '1';
			else
				edoLed <= '0';
			end if;
	end process;		
end arqSensor;
