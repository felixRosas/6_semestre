library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity parEjer65 is 
port(
clkl,reset,x: in std_logic;
s: out std_logic:='0'

);
end parEjer65;

architecture arqPar of parEjer65 is
subtype state is std_logic_vector(1 downto 0);
signal presentState, nextState: state;

constant e0: state := "00";
constant non: state := "01";
constant par: state := "10";
begin

	process (clkl)
		begin 
			if rising_edge(clkl) then 
				if (reset='1') then 	-- Checar linea
					presentState <= e0;
				else
					presentState <= nextState;
				end if;
			end if;	
	end process;

	process (presentState)
	begin
		case presentState is 
			when e0 => case x is
				 when '0' => nextState <= e0;
				 when '1' => nextState <= non;
			end case;	
		
		 
			when non => case x is
				 when '0' => nextState <= non;
				 when '1' => nextState <= par;
			end case;
			
			 
			when par => case x is
				 when '0' => nextState <= par;
				 when '1' => nextState <= non;
			end case;
			
			when others => nextState <= e0;
		end case;	
		
		if (presentState="10") then
			s <= '1';
		else
			s <= '0';
		end if;
	end process;
end arqPar;