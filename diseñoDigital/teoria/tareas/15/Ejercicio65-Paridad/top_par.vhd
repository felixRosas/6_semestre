library ieee;
use ieee.std_logic_1164.all;

entity top_par is 
port(
x,reset,clkl: in std_logic;
count:out std_logic
);

end top_par;

architecture arqpar of top_par is
signal cable1: std_logic;

begin
u1: entity work.relojLento(arqrelojlento) port map(clkl,cable1);
u2: entity work.parEjer65(arqPar) port map(cable1,reset,x,count);
end arqpar;

