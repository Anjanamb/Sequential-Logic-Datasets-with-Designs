-- testbench for Counter_3bit_AsyDown

-- Load Altera libraries for this chip
LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.MATH_REAL.uniform;
USE IEEE.MATH_REAL.floor;
USE MAXII.MAXII_COMPONENTS.ALL;

-- Set up this testbench as an entity
entity test_counter_3bit_AsyDown is
end test_counter_3bit_AsyDown;

-- Create an implementation of the entity
-- (May have several per entity)
architecture testbench1 of test_counter_3bit_AsyDown is
  signal button1 : std_logic;
  signal button2 : std_logic;
  signal button4 : std_logic;   
  signal led1    : std_logic;
  signal led2    : std_logic;
  signal led3    : std_logic;
  -- Set up the vcc signal as 1
  signal vcc  : std_logic := '1';
begin
  -- dut = device under test (same name as top project from Quartus)
    dut : entity work.counter_3bit_AsyDown
      -- Map the ports from the dut to this testbench
      port map (
        button1 => button1,
	button2 => button2,
        button4 => button4,
        led1 => led1,
        led2 => led2,
        led3 => led3 );
    
  -- Set up the signals    
  stimulus : process is
    variable seed1 : positive;
    variable seed2 : positive;
    variable x : real;
    variable y : integer;
  begin
    button1 <= '0'; 
    button2 <= '0';wait for 1 ps;
    seed1 := 999;
    seed2 := 999;
    loop
      uniform(seed1, seed2, x);
      y := integer(x);
      report "Number is " & integer'image(y);
      if (y=1) then
	    button1 <= '1'; 
	    button2 <= '0'; wait for 1 ps;
            button2 <= '1'; wait for 1 ps;
	    report "button1 is 1";
      else
	    button1 <= '0'; 
	    button2 <= '0'; wait for 1 ps;
            button2 <= '1'; wait for 1 ps;
	    report "button1 is 0";
      end if;
    end loop;
  end process;
end architecture;