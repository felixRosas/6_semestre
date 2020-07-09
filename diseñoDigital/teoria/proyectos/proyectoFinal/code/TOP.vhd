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
    --dipsw    :  in std_logic_vector (1 downto 0);
	 
	 --EXTRA
	 
	 reset	 : in  std_logic;
    button   : in  std_logic_vector(4 downto 0);
    led      : out std_logic_vector(23 downto 0)

	 
	 );

END TOP;

ARCHITECTURE arqTOP OF TOP IS
signal pix_clock: std_logic;
signal disp_ena: std_logic;
--signal column:  INTEGER;
--signal row:  INTEGER;
signal column , row: std_logic_vector(15 downto 0);
signal reloj    :  std_logic;

signal joypad_direction         : std_logic_vector(1 downto 0);
signal joypad_stop              : std_logic;



BEGIN
	
	u0: entity work.relojlento(arqrelojlento) port map(input_clk,reloj);
	u1: entity work.genMhz(arqgenMhz) port map(input_clk,pixel_clk);
	
	u2: entity work.vga_controller(behavior) port map(pixel_clk,
																		'1',
																		h_sync,
																		v_sync,
																		disp_ena,
																		column,
																		row
																		
																		
																		);
	
	u3: entity work.hw_image_generator(behavior) port map(disp_ena,
																			row,
																			column,
																			red,
																			green,
																			blue,
																			--dipsw,
																			reloj,
																			joypad_direction,
																			joypad_stop,
																			reset,
																			led
																			
																			
																			
    --direction           : in  std_logic_vector(1 downto 0);
    --stop                : in  std_logic;
    --reset               : in  std_logic;
    
    --debug_led           : out std_logic_vector(23 downto 0)
																			);

	u4: entity work.joypad(behavior) port map(reloj,
															button,
															joypad_stop,
															joypad_direction														 
															
        --clk_60hz    => clk_60hz,
        --button      => button,
        --stop        => joypad_stop,
        --direction   => joypad_direction


        --clk    : in std_logic;
        --button      : in std_logic_vector(4 downto 0);
        --stop        : out std_logic;
        --direction   : out std_logic_vector(1 downto 0)
															);	
END ARCHITECTURE arqTOP;


