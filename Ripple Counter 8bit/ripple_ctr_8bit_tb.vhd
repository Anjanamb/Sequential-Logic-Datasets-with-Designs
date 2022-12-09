-- testbench for 8bit_ripple_ctr

-- Load Altera libraries for this chip
LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

-- Set up this testbench as an entity
entity ripple_ctr_8bit_tb is
end ripple_ctr_8bit_tb;

-- Create an implementation of the entity
-- (May have several per entity)
architecture testbench1 of ripple_ctr_8bit_tb is

  -- Set up the signals on the 3bit_counter
  signal clk : std_logic;
  signal rst : std_logic;
  signal out0    : std_logic;
  signal out1    : std_logic;
  signal out2    : std_logic;
  signal out3    : std_logic;
  signal out4    : std_logic;
  signal out5    : std_logic;
  signal out6    : std_logic;
  signal out7    : std_logic;

  -- Set up the vcc signal as 1
  signal vcc  : std_logic := '1';
  
  begin
  -- dut = device under test (same name as top project from Quartus)
    dut : entity work.\8bit_ripple_ctr\
      -- Map the ports from the dut to this testbench
      port map (
        clk => clk,
	rst => rst,
        out0 => out0,
        out1 => out1,
        out2 => out2,
        out3 => out3,
	out4 => out4,
	out5 => out5,
	out6 => out6,
	out7 => out7 );
    
  -- Set up the signals    
  stimulus : process is
   begin
        loop
          clk <= '0'; wait for 10 ns;
          clk <= '1'; wait for 10 ns;
        end loop;
   end process;
end architecture;