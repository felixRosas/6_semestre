library ieee;
use ieee.std_logic_1164.all;

ENTITY TOP IS
PORT(
    input_clk:  in   STD_LOGIC; 
	 pixel_clk:  buffer   STD_LOGIC;  --pixel clock at frequency of VGA mode being used
    
	 --reset_n   :  IN   STD_LOGIC;  --active low asycnchronous reset
    
	 --n_blank   :  OUT  STD_LOGIC;  --direct blacking output to DAC
    --n_sync    :  OUT  STD_LOGIC; --sync-on-green output to DAC
	 
	 red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
	 h_sync   :  OUT  STD_LOGIC;  --horiztonal sync pulse
    v_sync   :  OUT  STD_LOGIC; --vertical sync pulse
    dipsw    :  in std_logic_vector (1 downto 0)
	 );

END TOP;

ARCHITECTURE arqTOP OF TOP IS
signal pix_clock: std_logic;
signal disp_ena: std_logic;
signal column:  INTEGER;
signal row:  INTEGER;
signal reloj    :  std_logic;
BEGIN
	
	u0: entity work.relojlento(arqrelojlento) port map(input_clk,reloj);
	u1: entity work.genMhz(arqgenMhz) port map(input_clk,pixel_clk);
	
	u2: entity work.vga_controller(behavior) port map(pixel_clk,
																		'1',
																		h_sync,
																		v_sync,
																		disp_ena,
																		column,
																		row);--,
																		--n_blank,
																		--n_sync);
	
	u3: entity work.hw_image_generator(behavior) port map(disp_ena,
																			row,
																			column,
																			red,
																			green,
																			blue,
																			dipsw,
																			reloj
																			);

END ARCHITECTURE arqTOP;


