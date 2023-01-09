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
  signal button1 : std_logic;
  signal button4 : std_logic;
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
        button1 => button1,
        button4 => button4,
	in1 => in1,
        out1 => out1,
        out2 => out2,
        out3 => out3,
        out4 => out4);

     clk_process :process
     begin
		button1 <= '0';
		wait for clk_period/2;
		button1 <= '1';
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
    		width := (rand1*0.00000001)*1 sec;
    		interval := (rand2*0.00000001)*1 sec;
		in1 <= '0'; 
		wait for width; 
		-- test parallel loading 
		in1 <= '1'; 
		wait for interval;
		-- test shift right 
		in1 <= '0'; 
		wait for width; -- shift 4 bits 
		-- test shift left 
		in1 <= '1'; 
		wait for interval; 
           end loop;
    end process stimulus;
end architecture testbench1;
