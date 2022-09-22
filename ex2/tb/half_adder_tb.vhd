-- Filename: half_adder_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

-- The entity declaration of
-- a testbench is empty.
entity half_adder_tb is
end entity;

architecture tb of half_adder_tb is

  -- Signals to be connected to the
  -- design under test.
  signal A : std_logic;
  signal B: std_logic;
  signal SUM: std_logic;
  signal COUT: std_logic;

begin

  -- Direct instantiation of
  -- the design under test
  dut: entity work.half_adder(rtl)
    port map(
      A => A,
      B => B,
      SUM => SUM,
      COUT => COUT
    );

  -- The process is a concurrent
  -- statement inside the architecture
  p_stimuli: process
  begin
    -- Inside the process, the statements are
    -- read sequentially and updated when the
    -- simulation time progresses.

    -- Set initial values for the inputs
    A <= '0';
    B <= '0';
    -- Progress simulation time
    wait for 50 ns;
    -- Update signal values
    A <= '1';
    B <= '0';
    -- Progress simulation time
    wait for 50 ns;
    A <= '0';
    B <= '1';
    -- Progress simulation time
    wait for 50 ns;
    A <= '1';
    B <= '1';
    -- Progress simulation time
    wait for 50 ns;
    -- stop the process
    wait; --halts the process forever.

  end process;

end architecture;
