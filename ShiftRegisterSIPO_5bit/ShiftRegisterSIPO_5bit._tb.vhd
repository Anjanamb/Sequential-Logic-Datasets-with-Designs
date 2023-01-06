library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
LIBRARY MAXII;
USE IEEE.MATH_REAL.uniform;
USE IEEE.MATH_REAL.floor;
USE MAXII.MAXII_COMPONENTS.ALL;

entity shift_reg_5bit_ss_tb is
end shift_reg_5bit_ss_tb;

architecture testbench1 of shift_reg_5bit_ss_tb is
    signal inp : std_logic;
    signal rst : std_logic;
    signal clk    : std_logic;
    signal out1    : std_logic;
    signal out2    : std_logic;
    signal out3    : std_logic;
    signal out4    : std_logic;
    signal out5    : std_logic;
    signal vcc  : std_logic := '1';
    constant clk_period : time := 10 ns;

begin
     dut : entity work.shift_reg_5bit_ss
      -- Map the ports from the dut to this testbench
      port map (
        inp => inp,
        rst => rst,
        clk => clk,
        out1 => out1,
        out2 => out2,
        out3 => out3,
        out4 => out4,
        out5 => out5 );

     clk_process :process
     begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
     end process;

     stimulus : process is
      variable seed1, seed2: positive;    -- seed values for random generator
      variable rand1 : real;              -- random real-number value, range 0 - 1.0
      variable seed3, seed4: positive;    -- seed values for random generator
      variable rand2 : real;              -- random real-number value, range 0 - 1.0
      variable width: time;               -- noise pulse width
      variable interval: time;  	
      -- test CLR 
      begin
           loop
		uniform(seed1, seed2, rand1);
    		uniform(seed3, seed4, rand2);
    		width := (rand1*0.00000001)*1 sec;
    		interval := (rand2*0.00000001)*1 sec;
		inp <= '0'; 
		wait for width; 
		-- test parallel loading 
		inp <= '1'; 
		wait for interval;
		-- test shift right 
		inp <= '0'; 
		wait for width; -- shift 4 bits 
		-- test shift left 
		inp <= '1'; 
		wait for interval; 
           end loop;

end process stimulus;
 
end architecture testbench1;
