-- testbench for counter_13bit

-- Load Altera libraries for this chip
LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

-- Set up this testbench as an entity
entity test_counter_13bit is
end test_counter_13bit;

-- Create an implementation of the entity
-- (May have several per entity)
architecture testbench1 of test_counter_13bit is

  -- Set up the signals on the 13bit_counter
  signal button1 : std_logic;
  signal button4 : std_logic;
  signal led1    : std_logic;
  signal led2    : std_logic;
  signal led3    : std_logic;
  signal led4    : std_logic;
  signal led5    : std_logic;
  signal led6    : std_logic;
  signal led7    : std_logic;
  signal led8    : std_logic;
  signal led9    : std_logic;
  signal led10   : std_logic;
  signal led11   : std_logic;
  signal led12   : std_logic;
  signal led13   : std_logic;

  -- Set up the vcc signal as 1
  signal vcc  : std_logic := '1';
  
  begin
    -- dut = device under test (same name as top project from Quartus)
    dut : entity work.counter_13bit
      -- Map the ports from the dut to this testbench
      port map (
        button1 => button1,
        button4 => button4,
        led1 => led1,
        led2 => led2,
        led3 => led3,
	led4 => led4,
	led5 => led5,
	led6 => led6,
	led7 => led7,
	led8 => led8,
	led9 => led9,
	led10 => led10,
	led11 => led11,
	led12 => led12,
	led13 => led13 );
    
    -- Set up the signals    
    stimulus : process is
      begin
        -- Just make a clock on button1 to simulate pushing the button
        loop
          button1 <= '0'; wait for 10 ps;
          button1 <= '1'; wait for 10 ps;
        end loop;
      end process stimulus;
end architecture testbench1;