library ieee;
use ieee.std_logic_1164.all;
entity contdes is port(
	clk, reset: in std_logic;
	count: out std_logic_vector (1 downto 0)
);
end entity;
architecture arqcontdes of contdes is
	subtype state is std_logic_vector (1 downto 0);
	signal present_state, next_state : state;
	constant state0: state :="00";
	constant state1: state :="01";
	constant state2: state :="10";
	constant state3: state :="11";
begin 
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset='1') then
				present_state<=state3;
			else
				present_state<=next_state;
			end if;
		end if;
	end process;
	process(present_state)
	begin
		case present_state is
			when state3   =>  next_state     <=state2;
			when state2   =>  next_state     <=state1;
			when state1   =>  next_state     <=state0;
			when state0   =>  next_state     <=state3;
			when others   =>  next_state     <=state3;
		end case;
		count<=present_state;
	end process;
end architecture;