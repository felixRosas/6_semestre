library ieee; 
use ieee.std_logic_1164.all;

entity cor is
port(
a,b: in std_logic; 
c: out std_logic);
end cor;


architecture arqcor of cor is
BEGIN 
c <= a or b; 
end architecture arqcor;