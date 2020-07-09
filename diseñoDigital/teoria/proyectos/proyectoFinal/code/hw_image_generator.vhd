--------------------------------------------------------------------------------
--
--   FileName:         hw_image_generator.vhd
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

ENTITY hw_image_generator IS
  GENERIC(
    pixels_y :  INTEGER := 480;   --row that first color will persist until
    pixels_x :  INTEGER := 640;    --column that first color will persist until
	 
	 -- For snake
        food_width          : integer := 20;
        head_width          : integer := 20;
		  
        snake_begin_x       : integer := 320;
        snake_begin_y       : integer := 240;
		  
        snake_length_begin  : integer := 1;
        snake_length_max    : integer := 20;
		  
        food_begin_x        : integer := 30;
        food_begin_y        : integer := 20
		  
	 ); 
  PORT(
    disp_ena :  IN   STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    --row      :  IN   INTEGER;    --row pixel coordinate
    --column   :  IN   INTEGER;    --column pixel coordinate
	 row, column            : in  std_logic_vector(15 downto 0);

    red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0'); --blue magnitude output to DAC
	 --dipsw    :  in std_logic_vector (1 downto 0);
	 
	 
	 
	 
	 --game logic part
    --clk_60hz            : in  std_logic;
	 reloj    :  in std_logic; --NO BORRAR

	 
	 
    direction           : in  std_logic_vector(1 downto 0);
    stop                : in  std_logic;
    reset               : in  std_logic;
    
    --rgb generation part
    --clk_108mhz          : in  std_logic;
    --en                  : in  std_logic;
    --row, col            : in  std_logic_vector(15 downto 0);
	 
    debug_led           : out std_logic_vector(23 downto 0)
    --rout, gout, bout    : out std_logic_vector(3 downto 0));
	 
	 
	);
	 
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS

subtype xy is std_logic_vector(31 downto 0);
type xys is array (integer range <>) of xy;

    --assume the left most xy is the head position
signal snake_length         : integer range 0 to snake_length_max;
signal snake_mesh_xy        : xys(0 to snake_length_max - 1);
signal food_xy              : xy;
signal random_xy            : unsigned(31 downto 0);

BEGIN -- ===========================[SNAKE CODE]=============================================  



ramdom_number_gen:
    process(reloj)
        variable random_x : unsigned(15 downto 0) := (others => '0');
        variable random_y : unsigned(15 downto 0) := (others => '0');
    begin
        if (rising_edge(reloj)) then
            if (random_x = to_unsigned(pixels_y - 14, 16)) then 
                random_x := (others => '0');
            end if;
				
            if (random_y = to_unsigned(pixels_x - 14, 16)) then 
                random_y := (others => '0');
            end if;
            
				random_x := random_x + 1;
            random_y := random_y + 1;
            random_xy(31 downto 16) <= random_x + 7;
            random_xy(15 downto 0) <= random_y + 7;
        end if;
    end process;



 snake_move:
    process(reloj, reset, random_xy)
        --speed in pixel
        constant snake_speed    : signed(15 downto 0) := to_signed(6, 16);

        variable inited                     : std_logic := '0';
        variable snake_head_xy_future       : xy := (others => '0');
        variable food_xy_future             : xy := (others => '0');
        variable snake_length_future        : integer := 0;
        variable dx, dy                     : signed(15 downto 0) := (others => '0');
    begin
        food_xy         <= food_xy_future;
        snake_length    <= snake_length_future;
		  
        if (reset = '1' or inited = '0') then
		  
            --reset snake length
            snake_length_future := snake_length_begin;

            --set food position
            food_xy_future(31 downto 16) := std_logic_vector(to_signed(food_begin_x, 16));
            food_xy_future(15 downto 0) := std_logic_vector(to_signed(food_begin_y, 16));

            --set head position
            snake_head_xy_future(31 downto 16)  := std_logic_vector(to_signed(snake_begin_x , 16));
            snake_head_xy_future(15 downto 0)   := std_logic_vector(to_signed(snake_begin_y , 16));

            --set snake position
            for i in 0 to snake_length_max - 1 loop
                snake_mesh_xy(i) <= snake_head_xy_future;
            end loop;
            
            inited := '1';
				
        elsif (rising_edge(reloj)) then
            if (stop = '0') then
				
                --move
                case direction is
                    when("00") =>       --up
                        snake_head_xy_future(15 downto 0) := std_logic_vector(signed(snake_head_xy_future(15 downto 0)) - snake_speed);
                    when("01") =>       --right
                        snake_head_xy_future(31 downto 16) := std_logic_vector(signed(snake_head_xy_future(31 downto 16)) + snake_speed);
                    when("10") =>       --down
                        snake_head_xy_future(15 downto 0) := std_logic_vector(signed(snake_head_xy_future(15 downto 0)) + snake_speed);
                    when("11") =>       --left
                        snake_head_xy_future(31 downto 16) := std_logic_vector(signed(snake_head_xy_future(31 downto 16)) - snake_speed);
                end case;
					 
					 --restart
                for i in snake_length_max - 1 downto 1 loop
                    snake_mesh_xy(i) <= snake_mesh_xy(i - 1);
                end loop;
                snake_mesh_xy(0) <= snake_head_xy_future; --push new head to snake body queue

                --boundary check
                if (signed(snake_head_xy_future(31 downto 16)) < 0 or 
                    signed(snake_head_xy_future(31 downto 16)) >= pixels_y or
                    signed(snake_head_xy_future(15 downto 0)) < 0 or
                    signed(snake_head_xy_future(15 downto 0)) >= pixels_x) then
                    inited := '0';
                end if;

                --food check
                dx := abs(signed(snake_head_xy_future(31 downto 16)) - signed(food_xy_future(31 downto 16)));
                dy := abs(signed(snake_head_xy_future(15 downto 0))  - signed(food_xy_future(15 downto 0)));
                if (dy < (food_width + head_width) / 2 and
                    dx < (food_width + head_width) / 2) then
                    snake_length_future := snake_length_future + 1;
						  
                    --change food position 
                    food_xy_future := std_logic_vector(random_xy);
                end if;
					 
            end if;
        end if;
    end process;

    debug_led <= std_logic_vector(random_xy(23 downto 0));


draw:
    process(snake_length, snake_mesh_xy, food_xy, row, column, disp_ena)
        --x and y distance from body part or food
        variable dx, dy             : signed(15 downto 0) := (others => '0');
        --if current pixel is belong to body or food
        variable is_body, is_food   : std_logic := '0';
    begin
        if (disp_ena = '1') then 
            
					--draw body
					is_body := '0';
					for i in 0 to snake_length_max - 1 loop
						 dx := abs(signed(column) - signed(snake_mesh_xy(i)(31 downto 16)));
						 dy := abs(signed(row) - signed(snake_mesh_xy(i)(15 downto 0)));
						 
						 if (i < snake_length) then  --if is valid snake body
							  if (dx < head_width / 2 and dy < head_width / 2) then
									is_body := '1';
							  end if;
						 end if;
						 
					end loop;
					
					
					--draw food
					dx := abs(signed(column) - signed(food_xy(31 downto 16)));
					dy := abs(signed(row) - signed(food_xy(15 downto 0)));
					if (dx < food_width / 2 and dy < food_width / 2) then
						 is_food := '1';
					else 
						 is_food := '0';
					end if;

            if (is_body = '1') then
                red <= "0000";
                green <= "1111";
                blue <= "1111";
            elsif (is_food = '1') then
                red <= "1100";
                green <= "1111";
                blue <= "0000";
            else 
                red <= "0000";
                green <= "0000";
                blue <= "0000";
            end if;
				
        else 
            red <= "0000";
            green <= "0000";
            blue <= "0000";
        end if;
    end process;
 
 
  
END behavior;
