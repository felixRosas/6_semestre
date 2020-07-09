library IEEE;
use IEEE.std_logic_1164.all;

entity luz2 is
	port(
		clk, boton, reset: 	in std_logic;
		lampara:					out std_logic;
		estados:			 		out std_logic_vector(1 downto 0)
	);
end luz2;

architecture arcluz2 of luz2 is
	
	subtype state is std_logic_vector(1 downto 0);
	signal present_state, next_state: state;
	constant e0: state := "00"; --apagadoA
	constant e1: state := "01"; --prendidoB
	constant e2: state := "10"; --prendidoC
	constant e3: state := "11"; --apagadoD

begin

	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '0') then
				present_state <= e0;
			else
				present_state <= next_state;
			end if;
		end if;
	end process;
	
	process(present_state, boton)
	begin
		case present_state IS
			when e0 => lampara <= '0';
				if boton = '1' then next_state <= e0; end if;
				if boton = '0' then next_state <= e1; end if;

			when e1 => lampara <= '1';
				if boton = '1' then next_state <= e2; end if;
				if boton = '0' then next_state <= e1; end if;
				
			when e2 => lampara <= '1';
				if boton = '1' then next_state <= e2; end if;
				if boton = '0' then next_state <= e3; end if;

			when others => lampara <= '0'; 
				if boton = '1' then next_state <= e0; end if;
				if boton = '0' then next_state <= e3; end if;
		end case;
		estados <= present_state;
	end process;
				
end arcluz2;