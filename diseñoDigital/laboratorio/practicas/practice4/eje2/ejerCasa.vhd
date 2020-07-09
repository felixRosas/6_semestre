library ieee;
use ieee.std_logic_1164.all;

entity ejerCasa is 
port(
a,b, cin: in std_logic;
s, cout: out std_logic
);
end ejerCasa;

architecture arqCasa of ejerCasa is 
begin 
s <= a xor b xor cin;
cout <= (a and b ) or ((a xor b ) and cin);
end architecture arqCasa;