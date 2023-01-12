-- testbench for ShiftRegisterSIPO_4bit

-- Load Altera libraries for this chip
LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.MATH_REAL.uniform;
USE IEEE.MATH_REAL.floor;
USE MAXII.MAXII_COMPONENTS.ALL;

-- Set up this testbench as an entity
entity test_ShiftRegisterSIPO_4bit is
end test_ShiftRegisterSIPO_4bit;

-- Create an implementation of the entity
-- (May have several per entity)
architecture testbench1 of test_ShiftRegisterSIPO_4bit is

  -- Set up the signals on the ShiftRegisterSISO_4bit
  signal clk : std_logic;
  signal clrn : std_logic;
  signal in1 : std_logic;
  signal out1    : std_logic;
  signal out2    : std_logic;
  signal out3    : std_logic;
  signal out4    : std_logic;

  -- Set up the vcc signal as 1
  signal vcc  : std_logic := '1';
  -- Set up the clock period
  constant clk_period : time := 10 ns;
  
  begin
    -- dut = device under test (same name as top project from Quartus)
    dut : entity work.ShiftRegisterSIPO_4bit
      -- Map the ports from the dut to this testbench
      port map (
        clk => clk,
        clrn => clrn,
	in1 => in1,
        out1 => out1,
        out2 => out2,
        out3 => out3,
        out4 => out4);

     clk_process :process
     begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
     end process;

    -- Set up the signals    
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
    		width := (rand1*0.0000001)*0.5 sec; -- 50ns
    		interval := (rand2*0.0000001)*0.5 sec; -- 50ns
		in1 <= '0'; 
		wait for width + 10 ns; 
		-- test parallel loading 
		in1 <= '1'; 
		wait for interval + 10 ns;
		-- test shift right 
		in1 <= '0'; 
		wait for width + 10 ns; -- shift 4 bits 
		-- test shift left 
		in1 <= '1'; 
		wait for interval + 10 ns; 
           end loop;
    end process stimulus;
end architecture testbench1;
