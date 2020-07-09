library ieee;
use ieee.std_logic_1164.all;
entity ejercicio1 is port(
	clk, inicio, x: in std_logic;
	var1, var0: out std_logic
);
end entity;
architecture arqeje1 of ejercicio1 is 
	subtype state is std_logic_vector (2 downto 0);
	signal present_state, next_state : state;
	constant state0: state:="000";
	constant state1: state:="001";
	constant state2: state:="010";
	constant state3: state:="011";
	constant state4: state:="100";
	constant state5: state:="101";
	constant state6: state:="110";
	
begin
	process(clk)
	begin
		if rising_edge(clk) then
			present_state<= next_state;
		end if;
	end process;

	process (present_state)
	begin
		case present_state is
			when state0 =>
							if (inicio='1') then
								if (x='0') then
									next_state<=state1;
								else
									next_state<=state4;
								end if;
							else
								next_state<=state0;
							end if;
							var1<='0';
							var0<='0';  --ambas variables no se activan en el estado 0
			when state1 =>
							next_state<=state2;
							var1<='1';
							var0<='1'; --var1 y var 0 activado
			when state2 =>
							next_state<=state3;
							var1<='1';
							var0<='0'; --var1 activado
			when state3 =>
							next_state<=state0;
							var1<='0';
							var0<='1'; --var0 activado
			when state4 =>
							next_state<=state5;
							var1<='0';
							var0<='1'; --var0 activado
			when state5 =>
							next_State<=state6;
							var1<='1';
							var0<='0'; --var1 activado
			when state6 =>
							next_state<=state0;
							var1<='1';
							var0<='1';--var1 y var0 activado
			when others =>
							next_state<=state0;
							var1<='0';
							var0<='0'; --ambas variables no se activan en el estado 0
		end case;
		
	end process;
end architecture;