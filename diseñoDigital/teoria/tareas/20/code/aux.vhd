BEGIN
IF(disp_ena = '1') THEN --display time
-- PRIMER EJERCICIO
    IF((row > 200  and row < 250) AND (column > 1 and column < 50)) THEN
        red <= (OTHERS => '0');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '1');
            
    ELSIF((row > 200  and row < 250) AND (column > 100 and column < 150)) THEN
        red <= (OTHERS => '0');
        green  <= (OTHERS => '1');
        blue <= (OTHERS => '0');
            
    ELSIF((row > 200  and row < 250) AND (column > 200 and column < 250)) THEN
        red <= (OTHERS => '1');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '0');
        
    ELSIF((row > 200  and row < 250) AND (column > 300 and column < 350)) THEN
        red <= (OTHERS => '1');
        green  <= (OTHERS => '1');
        blue <= (OTHERS => '1');
            
    ELSIF((row > 200  and row < 250) AND (column > 400 and column < 450)) THEN
        red <= (OTHERS => '1');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '0');
    
   -- SEGUNDO EJERCICIO
    IF((row > 200  and row < 210) AND (column > 110 and column < 140)) THEN
        red <= (OTHERS => '0');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '1');
     
    ELSIF((row > 210  and row < 240) AND (column > 140 and column < 150)) THEN
        red <= (OTHERS => '0');
        green  <= (OTHERS => '1');
        blue <= (OTHERS => '0');
            
    ELSIF((row > 250  and row < 280) AND (column > 140 and column < 150)) THEN
        red <= (OTHERS => '1');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '0');
        
    ELSIF((row > 280  and row < 290) AND (column > 110 and column < 140)) THEN
        red <= (OTHERS => '1');
        green  <= (OTHERS => '1');
        blue <= (OTHERS => '1');
            
    ELSIF((row > 250  and row < 280) AND (column > 100 and column < 110)) THEN
        red <= (OTHERS => '0');
        green  <= (OTHERS => '1');
        blue <= (OTHERS => '1');
            
    ELSIF((row > 210  and row < 240) AND (column > 100 and column < 110)) THEN
        red <= (OTHERS => '1');
        green  <= (OTHERS => '1');
        blue <= (OTHERS => '0');	
            
    ELSIF((row > 240  and row < 250) AND (column > 110 and column < 140)) THEN
        red <= (OTHERS => '1');
        green  <= (OTHERS => '0');
        blue <= (OTHERS => '1');
        
-- GENERAL		
   ELSE
   red <= (OTHERS => '0');
   green  <= (OTHERS => '0');
   blue <= (OTHERS => '0');
 END IF;
   
   
ELSE                           --blanking time
 red <= (OTHERS => '0');
 green <= (OTHERS => '0');
 blue <= (OTHERS => '0');
END IF;

END PROCESS;






VARIABLE x:  INTEGER:=50;
VARIABLE y:  INTEGER:=15;

BEGIN
  if (disp_ena ='1') then
        if ((row > x and row<x+20) AND (column>y and column <y+15)) then
            red <= (Others =>'1');	
        elsif((row > x+20 and row<x+40) AND (column>y-5 and column <y+20)) then
            red <= (Others =>'1');	
        else	
            red <= (Others =>'0');					
        end if;	
  end if;











  PROCESS(disp_ena, row, column)
  BEGIN
  IF(disp_ena = '1') THEN --display time
  -- PRIMER EJERCICIO
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
              
  ELSE                           --blanking time
   red <= (OTHERS => '0');
   green <= (OTHERS => '0');
   blue <= (OTHERS => '0');
  END IF;

END PROCESS;

