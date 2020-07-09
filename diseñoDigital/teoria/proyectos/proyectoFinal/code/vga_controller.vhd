--------------------------------------------------------------------------------
--
--   FileName:         vga_controller.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 64-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 05/10/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;--  puta linea 

ENTITY vga_controller IS
  GENERIC(
    --h_pulse  :  INTEGER   := 96;   --horiztonal sync pulse width in pixels
    --h_bp     :  INTEGER   := 48;   --horiztonal back porch width in pixels
    --h_pixels :  INTEGER   := 640;  --horiztonal display width in pixels
    --h_fp     :  INTEGER   := 16;   --horiztonal front porch width in pixels
    --h_pol    :  STD_LOGIC := '0';   --horizontal sync pulse polarity (1 = positive, 0 = negative)
    --v_pulse  :  INTEGER   := 2;     --vertical sync pulse width in rows
    --v_bp     :  INTEGER   := 33;    --vertical back porch width in rows
    --v_pixels :  INTEGER   := 480;  --vertical display width in rows
    --v_fp     :  INTEGER   := 10;     --vertical front porch width in rows
    --v_pol    :  STD_LOGIC := '0'--vertical sync pulse polarity (1 = positive, 0 = negative)
	 
	 
	  h_polar         : std_logic := '0';
     v_polar         : std_logic := '0';
     scr_width       : integer := 480;
     scr_height      : integer := 640;
	  
     h_front_porch   : integer := 16;
     h_sync_pulse    : integer := 96;
     h_back_porch    : integer := 48;
	  
     v_front_porch   : integer := 10;
     v_sync_pulse    : integer := 2;
     v_back_porch    : integer := 33
	 
	 );  
  
  PORT(
    --pixel_clk :  IN   STD_LOGIC;  --pixel clock at frequency of VGA mode being used
    --reset_n   :  IN   STD_LOGIC;  --active low asycnchronous reset
    --h_sync    :  OUT  STD_LOGIC;  --horiztonal sync pulse
    --v_sync    :  OUT  STD_LOGIC;  --vertical sync pulse
    --disp_ena  :  OUT  STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
	
	 clk             : in  std_logic;     --virtual clock called per pixel, should be 108mhz for 1600x900
	 reset_n   :  IN   STD_LOGIC;  --active low asycnchronous reset
    h_sync    :  OUT  STD_LOGIC;  --horiztonal sync pulse
    v_sync    :  OUT  STD_LOGIC;  --vertical sync pulse
	 en              : out std_logic;    --if display is enabled
    row, col        : out std_logic_vector(15 downto 0)

	 );
	 
END vga_controller;

ARCHITECTURE behavior OF vga_controller IS

    constant h_period : integer := scr_width  + h_front_porch + h_sync_pulse + h_back_porch;
    constant v_period : integer := scr_height + v_front_porch + v_sync_pulse + v_back_porch;
begin
    process (clk)
        variable h_count : integer range 0 to h_period - 1 := 0;
        variable v_count : integer range 0 to v_period - 1 := 0;
    begin
        if (clk'event and clk = '1') then
            --if is new line
            if (h_count = h_period - 1) then
                h_count := 0;
                if (v_count = v_period - 1) then
                    v_count := 0;
                else 
                    v_count := v_count + 1;
                end if;
            else
                h_count := h_count + 1;
            end if;

            --if not h_sync pulse
            if (h_count < scr_width + h_front_porch or 
                h_count >= scr_width + h_front_porch + h_sync_pulse) then 
                h_sync <= not h_polar;
            else 
                h_sync <= h_polar;
            end if;

            --if not v_sync pulse
            if (v_count < scr_height + v_front_porch or 
                v_count >= scr_height + v_front_porch + v_sync_pulse) then
                v_sync <= not v_polar;
            else 
                v_sync <= v_polar;
            end if;
            
            --set if is display time 
            if (h_count < scr_width and v_count < scr_height) then 
                en <= '1';
            else 
                en <= '0';
            end if;

            row <= std_logic_vector(to_unsigned(v_count, row'length));
            col <= std_logic_vector(to_unsigned(h_count, col'length));
        end if;
    end process;

END behavior;
