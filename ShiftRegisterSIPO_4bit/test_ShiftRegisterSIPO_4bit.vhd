-- testbench for ShiftRegisterSIPO_4bit

-- Load Altera libraries for this chip
LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
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
    
    -- Set up the signals    
    stimulus : process is
      begin
        -- Just make a clock on button1 to simulate pushing the button
        loop
	  in1 <= '0';
          clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
	  clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
	  clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
	  clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
	  in1 <= '1';
	  clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
	  clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
	  clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
	  clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
        end loop;
      end process stimulus;
end architecture testbench1;
