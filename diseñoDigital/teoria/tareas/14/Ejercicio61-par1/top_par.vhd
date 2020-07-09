library ieee;
use ieee.std_logic_1164.all;

entity top_par is 
port(
E,clk: in std_logic;
S:out std_logic
);

end top_par;

architecture arqpar of top_par is
signal D0,D1: std_logic;
signal Q0,Q1: std_logic;
begin
u1: entity work.combinacional(arqcomb) port map(E,Q0,Q1,D0,D1,S);
u2: entity work.ffd(arqffd) port map(D0,clk,Q0);
u3: entity work.ffd(arqffd) port map(D1,clk,Q1);

end arqpar;

