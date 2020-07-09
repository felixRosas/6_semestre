library ieee;
use ieee.std_logic_1164.all;
entity ejercicio2 is 
port(
    bdc: in  bit_vector(3 downto 0);
    led: out bit_vector(6 downto 0)
);
end ejercicio2;

architecture arcbdc7seg of ejercicio2 is 
begin 
with bdc select
 LED <= "1000000" when "0000",
        "1111001" when "0001",
        "0100100" when "0010",
        "0110000" when "0011",
        "0011001" when "0100",
        "0010010" when "0101",
        "0000010" when "0110",
        "1111000" when "0111",
        "0000000" when "1000",
        "0011000" when "1001",
        "1111111" when others;
end arcbdc7seg; 