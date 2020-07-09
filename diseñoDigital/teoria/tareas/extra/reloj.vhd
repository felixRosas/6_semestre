-- Sección Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Definicion entradas/salidas
entity reloj is
  Port ( 
    clk : in std_logic;
    H_d, H, M_d, M : out std_logic_vector(6 downto 0)
  );
end reloj;

--Arquitectura
architecture Behavioral of reloj is
  --Definición de señales 
  signal segundo : std_logic;
  signal d_segundo : std_logic;
  signal minuto : std_logic;
  signal d_minuto : std_logic;
  signal hora : std_logic;
  signal d_hora, aux : std_logic;
  signal minuto_1 : std_logic_vector(3 downto 0) := "0000";
  signal minuto_2 : std_logic_vector(3 downto 0) := "0000";
  signal hora_1 : std_logic_vector(3 downto 0) := "0000";
  signal hora_2 : std_logic_vector(3 downto 0) := "0000";

  -- Begin
  begin
    -- Proceso divisor
    divisor : process(clk)
      -- Definicion de variables
      variable cuenta: std_logic_vector(27 downto 0) := X"0000000";
      begin
        if rising_edge (clk) then
          if cuenta = X"48009E0" then
            cuenta := X"0000000";
          else
            cuenta := cuenta + 1;
          end if;
        end if;
        segundo <= cuenta(24);
      end process;
    -- Contador de unidades de segundos
    contadorUnidadesSeg : process(segundo)
      -- Definición de variables
      variable cuenta: std_logic_vector(3 downto 0) := "0000";
      begin
        if rising_edge (segundo) then
          if cuenta = "1001" then
            cuenta := "0000";
            d_segundo <= '1';
          else
            cuenta := cuenta + 1;
            d_segundo <= '0';
          end if;
        end if;
      end process;
    -- Proceso contador de decenas de segundos
    contadorDecenasSeg : process(d_segundo)
      -- Definición de variables
      variable cuenta: std_logic_vector(3 downto 0) := "0000";
      begin
        if rising_edge (d_segundo) then
          if cuenta = "0101" then
            cuenta := "0000";
            minuto <= '1';
          else
            cuenta := cuenta + 1;
            minuto <= '0';
          end if;
        end if;
      end process;

    -- Contador de las unidades de minuto
    contadorUnidadesMin : process(minuto)
      -- Definición de variables
       variable cuenta: std_logic_vector(3 downto 0) := "0000";
      begin
        if rising_edge (minuto) then
          if cuenta = "1001" then
            cuenta := "0000";
            d_minuto <= '1';
          else
            cuenta := cuenta + 1;
            d_minuto <= '0';
          end if;
        end if;
        minuto_1 <= cuenta;
      end process;
    -- Contador de Decenas de minuto
    contadorDecenasMin : process(d_minuto)
      -- Definición de variables
      variable cuenta: std_logic_vector(3 downto 0) := "0000";
      begin
        if rising_edge (d_minuto) then
          if cuenta = "0101" then
            cuenta := "0000";
            hora <= '1';
          else
            cuenta := cuenta + 1;
            hora <= '0';
          end if;
        end if;
        minuto_2 <= cuenta;
      end process;


      -- Contador Unidades de Hora
      contadorUnidadesHora : process(hora)
        -- Definición de variables
        variable cuenta: std_logic_vector(3 downto 0) := "0000";
        begin
          if rising_edge (hora) then
            if cuenta = "1001" then
              cuenta := "0000";
              d_hora <= '1';
              aux <= '0';
            elsif hora_1 = "0011" and hora_2 = "0010" then
              cuenta := "0000";
              aux <= '1';
              d_hora <= '1';
            else
              cuenta := cuenta + 1;
              d_hora <= '0';
              aux <= '0';
            end if;
          end if;
          hora_1 <= cuenta;
        end process;
    -- Contador de Decenas de Hora
    contadorDecenasHora : process(d_hora)
      -- Definición de variables
      variable cuenta: std_logic_vector(3 downto 0) := "0000";
      begin
        if rising_edge (d_hora) then
          if aux = '1' then
            cuenta := "0000";
          else
            cuenta := cuenta + 1;
          end if;
        end if;
      hora_2 <= cuenta;
      end process;

    with minuto_1 select M <=
      "1000000" when "0000",
      "1111001" when "0001",
      "0100100" when "0010",
      "0110001" when "0011",
      "0011001" when "0100",
      "0010010" when "0101",
      "0000010" when "0110",
      "1111000" when "0111",
      "0000000" when "1000",
      "0010000" when "1001",
      "1111111" when others;
    with minuto_2 select M_d <=
      "1000000" when "0000",
      "1111001" when "0001",
      "0100100" when "0010",
      "0110001" when "0011",
      "0011001" when "0100",
      "0010010" when "0101",
      "1111111" when others;
    with hora_1 select H <=
      "1000000" when "0000",
      "1111001" when "0001",
      "0100100" when "0010",
      "0110001" when "0011",
      "0011001" when "0100",
      "0010010" when "0101",
      "0000010" when "0110",
      "1111000" when "0111",
      "0000000" when "1000",
      "0010000" when "1001",
      "1111111" when others;
    with hora_2 select H_d <=
      "1000000" when "0000",
      "1111001" when "0001",
      "0100100" when "0010",
      "0110001" when "0011",
      "0011001" when "0100",
      "0010010" when "0101",
      "1111111" when others;
end Behavioral;
