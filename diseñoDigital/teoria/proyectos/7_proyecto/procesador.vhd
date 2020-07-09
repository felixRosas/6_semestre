library ieee;
use ieee.std_logic_1164.all;

entity procesador is 
port(clk: in std_logic;
	  RW : in std_logic_vector(3 downto 0);
	  ld : in std_logic;
	  Rx	: in std_logic_vector (3 downto 0);
	  Qx	: in std_logic_vector (7 downto 0);
	  Ry	: in std_logic_vector (3 downto 0);
	  Qy	: in std_logic_vector (7 downto 0);
	  Rz	: in std_logic_vector (3 downto 0);
	  Qz	: in std_logic_vector (7 downto 0);
	  PC : out std_logic_vector(7 downto 0) --Program Coutenr 
	);
end entity;

architecture behavior of procesador is 

	signal F_ext : std_logic_vector(7 downto 0);
	signal Q0 ,Q1,Q2,Q3,Q4,Q5,Q6,Q7 : std_logic_vector(7 downto 0);
	signal ld0 ,ld1,ld2,ld3,ld4,ld5,ld6,ld7 : std_logic;
	
	
	--op1_sel
	--Rx <= op1 when op1_sel = '0' else x"7";
	
	--op3_sel
--	Rz <= op3 when op3_sel = '0' else x"7";

begin 
		r0 : entity work.register8(behavior) port map(clk, ld0, F, Q0);
		r1 : entity work.register8(behavior) port map(clk , ld1, F , Q1);
		r2 : entity work.register8(behavior) port map(clk , ld2, F , Q2);
		r3 : entity work.register8(behavior) port map(clk , ld3, F , Q3);
		r4 : entity work.register8(behavior) port map(clk , ld4, F , Q4);
		r5 : entity work.register8(behavior) port map(clk , ld5, F , Q5);
		r6 : entity work.register8(behavior) port map(clk , ld6, F , Q6);
		r7 : entity work.register8(behavior) port map(clk , ld7, F , Q7);

	

		ld0 <= ld when RW  = "0000"  else '0';
		ld1 <= ld when RW  = "0001"  else '0';
		ld2 <= ld when RW  = "0010"  else '0';
		ld3 <= ld when RW  = "0011"  else '0';
		ld4 <= ld when RW  = "0100"  else '0';
		ld5 <= ld when RW  = "0101"  else '0';
		ld6 <= ld when RW  = "0110"  else '0';
		ld7 <= ld when RW  = "0111"  else '0';
		
		PC <= Q7;
		
		with Rx select
			Qx<=Q0 when "0000",
			Qx<=Q1 when "0001",
			Qx<=Q2 when "0010",
			Qx<=Q3 when "0011",
			Qx<=Q4 when "0100",
			Qx<=Q5 when "0101",
			Qx<=Q6 when "0110",
			Qx<=Q7 when "0111",
			Qx<=x"00" when others;
		
		with Ry select
			Qy<=Q0 when "0000",
			Qy<=Q1 when "0001",
			Qy<=Q2 when "0010",
			Qy<=Q3 when "0011",
			Qy<=Q4 when "0100",
			Qy<=Q5 when "0101",
			Qy<=Q6 when "0110",
			Qy<=Q7 when "0111",
			Qy<=x"00" when others;
			
		with Rz select
			Qz<=Q0 when "0000",
			Qz<=Q1 when "0001",
			Qz<=Q2 when "0010",
			Qz<=Q3 when "0011",
			Qz<=Q4 when "0100",
			Qz<=Q5 when "0101",
			Qz<=Q6 when "0110",
			Qz<=Q7 when "0111",
			Qz<=x"00" when others;
	
end architecture behavior;