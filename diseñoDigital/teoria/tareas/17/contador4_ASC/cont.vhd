library ieee;
use ieee.std_logic_1164.all;
 
entity cont is
port(
	clk, reset:	in std_logic;
	sal: 	out std_logic_vector(3 downto 0)
);
end cont;
 
architecture behaviour of cont is

subtype state is std_logic_vector(3 downto 0);
signal present_state, next_state: state;
constant e0: state := "0000";
constant e1: state := "0001";
constant e2: state := "0010";
constant e3: state := "0011";
constant e4: state := "0100";
constant e5: state := "0101";
constant e6: state := "0110";
constant e7: state := "0111";
constant e8: state := "1000";
constant e9: state := "1001";
constant e10: state := "1010";
constant e11: state := "1011";
constant e12: state := "1100";
constant e13: state := "1101";
constant e14: state := "1110";
constant e15: state := "1111";

begin

	process (clk)
	begin
		if clk = '1' then
			if (reset = '0') then
				present_state <= e0;
			else
				present_state <= next_state;
			end if;
		end if;
	end process;
	
	process (present_state)
	begin
		case present_state is
			when e0 =>
				next_state <= e1;
			when e1 =>
				next_state <= e2;
			when e2 =>
				next_state <= e3;
			when e3 =>
				next_state <= e4;
			when e4 =>
				next_state <= e5;
			when e5 =>
				next_state <= e6;
			when e6 =>
				next_state <= e7;
			when e7 =>
				next_state <= e8;
			when e8 =>
				next_state <= e9;
			when e9 =>
				next_state <= e10;
			when e10 =>
				next_state <= e11;
			when e11 =>
				next_state <= e12;
			when e12 =>
				next_state <= e13;
			when e13 =>
				next_state <= e14;
			when e14 =>
				next_state <= e15;
			when e15 =>
				next_state <= e0;
			when others =>
				next_state <= e0;
		end case;
		sal <= present_state;
	end process;				
	
end behaviour;
