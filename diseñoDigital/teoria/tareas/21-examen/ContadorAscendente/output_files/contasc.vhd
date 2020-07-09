library ieee;
use ieee.std_logic_1164.all;
entity contasc is port(
	clk, reset: in std_logic;
	count: out std_logic_vector (2 downto 0)
);
end entity;
architecture arqcontasc of contasc is
	subtype state is std_logic_vector (2 downto 0);
	signal present_state, next_state : state;
	constant state0: state :="000";
	constant state1: state :="001";
	constant state2: state :="010";
	constant state3: state :="011";
	constant state4: state :="100";
	constant state5: state :="101";
	constant state6: state :="110";
	constant state7: state :="111";
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
			when state0   =>  next_state     <=state1;
			when state1   =>  next_state     <=state2;
			when state2   =>  next_state     <=state3;
			when state3   =>  next_state     <=state4;
			when state4   =>  next_state     <=state5;
			when state5   =>  next_state     <=state6;
			when state6   =>  next_state     <=state7;			
			when state7   =>  next_state     <=state0;
			when others   =>  next_state     <=state0;
		end case;
		count<=present_state;
	end process;
end architecture;