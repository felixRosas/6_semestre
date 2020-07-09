library ieee;
use ieee.std_logic_1164.all;

entity topalu is
port(
selu: in std_logic_vector(2 downto 0);
a,b: in std_logic_vector (1 downto 0);
cin: in std_logic;
sal: out std_logic_vector(1 downto 0);
cout: out std_logic
);
end topalu;


architecture arqtopalu of topalu is
signal salua, salul: std_logic_vector(1 downto 0);
BEGIN 
u1: entity work.topua(arqtopua) port map(selu(1 downto 0),a,b,cin,salua,cout);
u2: entity work.compuertas(arqcomp) port map(selu(1 downto 0),a,b,salul);
u3: entity work.muxt(arqmuxt) port map(selu(2),salua,salul,sal);


end architecture arqtopalu;