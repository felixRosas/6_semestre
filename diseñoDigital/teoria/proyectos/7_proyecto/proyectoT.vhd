library ieee;
use ieee.std_logic_1164.all;

entity proyectoT  is 
port(clk: in std_logic
	);
end entity;

architecture behavior of proyectoT is 
	--signal clk : std_logic;
	signal PC : std_logic_vector(7 downto 0 );
	signal rw :  std_logic_vector(2 downto 0);
	signal ld:  std_logic;
begin 
	regNet : entity work.procesador(behavior) port map (clk , rw, ld , PC );
	
		--op1_sel
	Rx <= op1 when op1_sel = '0' else x"7";
	
	--op3_sel
   Rz <= op3 when op3_sel = '0' else x"7";
	
	/*process(clk50MHZ)
		variable cnt : integer range 0 to 24 := 0;
		begin 
			if rising_edge(clk50MHZ) then 
				clk <= not clk;
				cnt := 0;
			else
				cnt := cnt +1;
			end if;
	end process; */
end architecture behavior;