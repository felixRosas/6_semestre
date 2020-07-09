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

ENTITY hw_image_generator IS
  GENERIC(
    pixels_y :  INTEGER := 640;   --row that first color will persist until
    pixels_x :  INTEGER := 480);  --column that first color will persist until
  PORT(
    disp_ena :  IN   STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    row      :  IN   INTEGER;    --row pixel coordinate
    column   :  IN   INTEGER;    --column pixel coordinate
    red      :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
    green    :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
    blue     :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0'); --blue magnitude output to DAC
	 dipsw    :  in std_logic_vector (1 downto 0);
	 reloj    :  in std_logic);
	 
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
signal x,y,x1,y1,x2,y2: integer range 0 to 600;

BEGIN
  PROCESS(disp_ena, row, column) 
  BEGIN
         IF((row > 200  and row < 250) AND (column > 1 and column < 50)) THEN
            red <= (OTHERS => '1');
            green  <= (OTHERS => '1');
            blue <= (OTHERS => '1');
                  
       ELSIF((row > 200  and row < 250) AND (column > 100 and column < 150)) THEN
            red <= (OTHERS => '1');
            green  <= (OTHERS => '1');
            blue <= (OTHERS => '1');
                  
       ELSIF((row > 200  and row < 250) AND (column > 200 and column < 250)) THEN
            red <= (OTHERS => '1');
            green  <= (OTHERS => '1');
            blue <= (OTHERS => '1');
            
       ELSIF((row > 200  and row < 250) AND (column > 300 and column < 350)) THEN
            red <= (OTHERS => '1');
            green  <= (OTHERS => '1');
            blue <= (OTHERS => '1');
                  
       ELSIF((row > 200  and row < 250) AND (column > 400 and column < 450)) THEN
            red <= (OTHERS => '1');
            green  <= (OTHERS => '1');
            blue <= (OTHERS => '1');	  
            
       ELSIF((row > 200  and row < 250) AND (column > 500 and column < 550)) THEN
            red <= (OTHERS => '1');
            green  <= (OTHERS => '1');
            blue <= (OTHERS => '1');	
          
      ELSIF((row > 200  and row < 250) AND (column > 600 and column < 650)) THEN
            red <= (OTHERS => '1');
            green  <= (OTHERS => '1');
            blue <= (OTHERS => '1');	 
            
      -- GENERAL		
      ELSE
          red <= (OTHERS => '0');
          green  <= (OTHERS => '0');
          blue <= (OTHERS => '0');
      END IF;
  
  
	  if (disp_ena ='1') then
			if ((row > x and row<x+50) AND (column>y+10 and column <y+40)) then
				red<=(Others =>'1');
			elsif ((row > (x-10) and row<(x+60)) AND (column>(y+30) and column <(y+40))) then
				red <= (Others =>'1');
			else	
				red <= (Others =>'0');
			end if;	
	  end if;
		
  END PROCESS;
  process(reloj, dipsw)
  begin
		if( reloj'event and reloj='1') then
			if(dipsw(1)='1' and dipsw(0)='1') then 
					if(y>0 and y<500) then
						x<=x;
						y<=y+1;
					else
						y<=50;
					end if;
			elsif ( dipsw(1)='0' and dipsw(0)='0') then
					if(y>0 and y<500) then
						x<=x;
						y<=y-1;
					else
						y<=50;
					end if;
			elsif ( dipsw(1)='0' and dipsw(0)='1') then
					if(x>0 and x<400) then
						x<=x+1;
						y<=y;
					else
						x<=50;
					end if;
			elsif ( dipsw(1)='1' and dipsw(0)='0') then
					if(x>0 and x<400) then
						x<=x-1;
						y<=y;
					else
						x<=50;
					end if;
			end if;
		end if;
  end process;
  
  
END behavior;
