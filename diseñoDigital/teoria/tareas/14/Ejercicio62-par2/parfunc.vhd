library ieee;
use ieee.std_logic_1164.all;

entity parfunc is 
port(
E,clk,reset: in std_logic;
S:out std_logic
);

end parfunc;

architecture arqpar of parfunc is
subtype state is std_logic_vector(1 downto 0);
signal present_state,next_state: state;
signal count: integer range 0 to 50000000;
constant e0: state:="00";
constant non: state:="01";
constant par: state:="10";

begin

process (clk) 
begin 
	if rising_edge(clk) then
		count<= count+1;
		if (count = 50000000) then
			count<=0;
			if (reset='1') then
				present_state <= e0;
			else
				present_state<=next_state;
			end if;
		end if;
	end if;
end process;

process (present_state)
begin
	case present_state is
		when e0=>
			if (E='0') then next_state<=e0; end if;
			if (E='1') then next_state<=non; end if;
			S<='0';
		when non=>
			if (E='0') then next_state<=non; end if;
			if (E='1') then next_state<=par; end if;
			S<='0';			
		when par=>
			if (E='0') then next_state<=par; end if;
			if (E='1') then next_state<=non; end if;
			S<='1';			
		when others => next_state<=e0;
	end case;
end process;
	
end arqpar;