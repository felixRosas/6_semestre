library ieee;
use ieee.std_logic_1164.all;

entity contafunc is 
port(
clk,reset: in std_logic;
S:out std_logic_vector (1 downto 0)
);

end contafunc;

architecture arqconta of contafunc is
subtype state is std_logic_vector(1 downto 0);
signal present_state,next_state: state;
signal count: integer range 0 to 50000000;
constant e00: state:="00";
constant e01: state:="01";
constant e10: state:="10";
constant e11: state:="11";

begin

process (clk) 
begin 
	if rising_edge(clk) then
		count<= count+1;
		if (count = 50000000) then
			count<=0;
			if (reset='1') then
				present_state <= e00;
			else
				present_state<=next_state;
			end if;
		end if;
	end if;
end process;

process (present_state)
begin
	case present_state is
		when e00=>
			next_state <= e01;
			S<="00";
		when e01=>
			next_state <= e10;
			S<="01";
		when e10=>
			next_state <= e11;
			S<="10";	
		when e11=>
			next_state <= e00;
			S<="11";
			
		when others => next_state<=e00;
	end case;
end process;
	
end arqconta;