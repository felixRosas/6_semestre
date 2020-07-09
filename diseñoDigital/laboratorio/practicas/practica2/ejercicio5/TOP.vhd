library ieee;
use ieee.std_logic_1164.all;

ENTITY TOP IS
PORT(
    pixel_clk :  IN   STD_LOGIC;  --pixel clock at frequency of VGA mode being used
    reset_n   :  IN   STD_LOGIC;  --active low asycnchronous reset
    h_sync    :  OUT  STD_LOGIC;  --horiztonal sync pulse
    v_sync    :  OUT  STD_LOGIC;  --vertical sync pulse
    n_blank   :  OUT  STD_LOGIC;  --direct blacking output to DAC
    n_sync    :  OUT  STD_LOGIC; --sync-on-green output to DAC
	 red      :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')
	 ); --blue magnitude output to DAC

END TOP;

ARCHITECTURE arqTOP OF TOP IS
signal sig1: std_logic;  
signal sig2, sig3: INTEGER;
BEGIN
u1: entity work.vga_controller(behavior) port map(pixel_clk,reset_n,h_sync,v_sync,sig1,sig2,sig3,n_blank,n_sync);
u2: entity work.hw_image_generator(behavior) port map(sig1,sig3,sig2,red,green,blue);

END ARCHITECTURE arqTOP;