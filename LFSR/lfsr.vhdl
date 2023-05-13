LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE STD.TEXTIO.ALL;

ENTITY Testbench IS
END Testbench;

ARCHITECTURE TBarch OF Testbench IS
  COMPONENT LFSR8 IS
    PORT (Clk, Rst: IN std_logic;
          output: OUT std_logic_vector (7 DOWNTO 0));
  END COMPONENT;

  SIGNAL Clk_s, Rst_s: std_logic;
  SIGNAL output_s: std_logic_vector(7 DOWNTO 0);

file tb_file : text open write_mode is "tb_output.txt";

BEGIN
  CompToTest: LFSR8 PORT MAP (Clk_s, Rst_s, output_s);

  write_to_file : process(Clk_s)
  variable line : line;
  begin
    if rising_edge(Clk_s) then
	  write(line, std_logic'image(Rst_s));
	  write(line, ' ');
          write(line, std_logic'image(output_s(0)));
	  write(line, ' '); -- Separate with a space
	  writeline(tb_file, line);
    end if;
  end process write_to_file;
  Clk_proc: PROCESS
  BEGIN
    Clk_s <= '1';
    WAIT FOR 10 ns;
    Clk_s <= '0';
    WAIT FOR 10 ns;
  END PROCESS clk_proc;
                      
  Vector_proc: PROCESS
  BEGIN
    Rst_s <= '1';
    WAIT FOR 5 NS;
    Rst_s <= '0';
    FOR index IN 0 To 4 LOOP
      WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
    END LOOP;
    WAIT FOR 5 NS;
    ASSERT output_s = X"88" REPORT "Failed output=88";
    WAIT;
  END PROCESS Vector_proc;

END TBarch;
