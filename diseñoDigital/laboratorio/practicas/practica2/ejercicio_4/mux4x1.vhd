library ieee; 
use ieee.std_logic_1164.all; 

entity mux4x1 is 

port( 
s: in std_logic_vector(1 downto 0); 
b: in std_logic_vector(1 downto 0); 
salmux4x1: out std_logic_vector(1 downto 0) 
); 
end entity mux4x1; 


architecture arqmux4x1 of mux4x1 is 
begin 
with s select 
salmux4x1 <=  
	(others=>'1') when "00", 
			  not b when "01", 
					b when "10", 
	(others=>'0') when "11", 
	(others=>'0') when others; 
	
end architecture arqmux4x1;