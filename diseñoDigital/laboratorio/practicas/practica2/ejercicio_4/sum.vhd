library ieee; 

use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all; 
 

entity sum is 
	port(a, b: in std_logic_vector(1 downto 0); 
			cin: in std_logic; 
	salsum: out std_logic_vector(1 downto 0); 
	cout: out std_logic); 
end entity sum; 

 
architecture arqsum of sum is 
signal mid: std_logic_vector(2 downto 0); 
begin 
mid<=('0' & a) + ('0' & b) + cin; 
cout <=mid(2); 
salsum<=mid(1 downto 0); 
end architecture arqsum; 