library ieee;
use ieee.std_logic_1164.all;

entity carritoV1 is 
port(
--Variables internos para logic
clk, reset: in std_logic;
s: in std_logic_vector(1 downto 0);

--Variables de salida
estados,motorDer,motorIzq: out std_logic_vector(1 downto 0)
);
end entity;

architecture arqCarritoV1 of carritoV1 is 
--Generamos un subtipo para escribir menos as objects on  OOP
subtype state is std_logic_vector(1 downto 0);
signal presentState, nextState: state;
constant alto: state := "11";--"00"; 
constant mf: state := "10";--"01";
constant md: state := "01";--"10";
constant mi: state := "00";--"11";

begin

--clock process 
process (clk)
	begin 
		if rising_edge(clk) then -- Flanco de Subida de la señal de clk _|-|
			if (reset='0') then 	
				presentState <= alto;
			else
				presentState <= nextState;
			end if;
		end if;	
	end process;

--state process 
process (presentState,s)
	begin 
		case presentState is 
			
			when alto => case s is --CARRO SE DETIENE
								when "00" => nextState <= alto;
								when "01" => nextState <= mi;
								when "10" => nextState <= md;
								when others => nextState <= mf;
							end case;
							motorDer<= "00";
							motorIzq<= "00";
			
			when mf => case s is --CARRO se mueve hacia adelante
								when "00" => nextState <= alto;
								when "01" => nextState <= mi;
								when "10" => nextState <= md;
								when others => nextState <= mf;
							end case;
							motorDer<= "01";
							motorIzq<= "01";
							
			when md => case s is --CARRO se mueve hacia derecha
								when "00" => nextState <= alto;
								when "01" => nextState <= mi;
								when "10" => nextState <= md;
								when others => nextState <= mf;
							end case;
							motorDer<= "01";
							motorIzq<= "00";
			
			when mi => case s is --CARRO se mueve hacia izquierda
								when "00" => nextState <= alto;
								when "01" => nextState <= mi;
								when "10" => nextState <= md;
								when others => nextState <= mf;
							end case;
							motorDer<= "00";
							motorIzq<= "01";
		
			when others => nextState <= alto;
		end case;
	
	-- Asignacion del estado presente 
	estados <= presentState;
	end process;	

end architecture;







