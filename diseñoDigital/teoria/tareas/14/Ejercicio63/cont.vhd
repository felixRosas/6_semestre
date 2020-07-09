library ieee;
use ieee.std_logic_1164.all;

entity cont is 
port(
clk: in std_logic;
S0,S1:out std_logic
);

end cont;

architecture arqcont of cont is
signal D0,D1: std_logic;
signal Q0,Q1: std_logic;
signal sal1,sal2: std_logic;

begin
u1: entity work.combinacional(arqcomb) port map(Q0,Q1,D0,D1);
u2: entity work.ffd(arqffd) port map(D0,clk,Q0);
u3: entity work.ffd(arqffd) port map(D1,clk,Q1);
u4: entity work.ffd(arqffd) port map(Q0,clk,S0);
u5: entity work.ffd(arqffd) port map(Q1,clk,S1);

end arqcont;
