library ieee;
use ieee.std_logic_1164.all;

entity topua is
port(
sel: in std_logic_vector(1 downto 0);
a,b: in std_logic_vector (1 downto 0);
cin: in std_logic;
sal: out std_logic_vector(1 downto 0);
cout: out std_logic
);
end topua;


architecture arqtopua of topua is
signal cableb: std_logic_vector(1 downto 0); 
BEGIN 
u1: entity work.mux2x1(arqmux21) port map(sel,b,cableb);
u2: entity work.sumbit2(arqsb2) port map(a,cableb,cin,sal,cout);

end architecture arqtopua;