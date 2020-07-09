library ieee;
use ieee.std_logic_1164.all;
-- No es sensible a mayusculas y minusculas

entity practica1 is 
port(
a,b: in std_logic; --Entradas de la compuerta -> Solo un bit
c: out std_logic); --Salida de la compuerta -> Solo un bit
end practica1;

architecture arqprac1 of practica1 is 
-- You can declarate variables o signals -> No son puertos
begin 
c <= a or b; -- Asignacion
end architecture arqprac1;


--VHDL  tiene dos elementos

--Entity -> Sirve para declarar puertos de entrada y salida
--		in -> Entradas
--		out -> Salidas

--arquitecture -> Es para la utilizacion de los puertos 
--					   mediante las compuertas	

-- No puede simularse if it's not compilated
