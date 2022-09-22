-- Filename: half_adder_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

-- The entity declaration of
-- a testbench is empty.
entity full_adder_tb is
end entity;

architecture tb of full_adder_tb is

  -- Signals to be connected to the
  -- design under test.
  signal A : std_logic;
  signal B: std_logic;
  signal SUM: std_logic;
  signal COUT: std_logic;
  signal CIN: std_logic;

begin

  -- Direct instantiation of
  -- the design under test
  dut: entity work.full_adder(rtl)
    port map(
      A => A,
      B => B,
      SUM => SUM,
      COUT => COUT,
      CIN => CIN
    );

  -- The process is a concurrent
  -- statement inside the architecture
  p_stimuli: process
  begin
    -- Inside the process, the statements are
    -- read sequentially and updated when the
    -- simulation time progresses.

    -- Set initial values for the inputs
    CIN <= '0';      
    A <= '0';
    B <= '0';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "00"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 00"
        severity warning;
    -- Update signal values
    CIN <= '0';      
    A <= '1';
    B <= '0';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "01"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 01"
        severity warning;
    CIN <= '0';      
    A <= '0';
    B <= '1';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "01"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 01"
        severity warning;
    CIN <= '0';      
    A <= '1';
    B <= '1';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "10"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 10"
        severity warning;
    CIN <= '1';      
    A <= '0';
    B <= '0';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "01"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 01"
        severity warning;
    -- Update signal values
    CIN <= '1';      
    A <= '1';
    B <= '0';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "10"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 10"
        severity warning;
    CIN <= '1';      
    A <= '0';
    B <= '1';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "10"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 10"
        severity warning;
    CIN <= '1';      
    A <= '1';
    B <= '1';
    -- Progress simulation time
    wait for 50 ns;
    assert (COUT & SUM) = "11"
        report "(COUT & SUM) = " & to_string(COUT & SUM) & ", expected 11"
        severity warning;
    -- stop the process
    wait; --halts the process forever.

  end process;

end architecture;
