library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;

architecture tb of counter_tb is

        signal clk : std_logic;
        signal clk_period : time := 20 ns;
        signal clk_enable : boolean := false;

        signal reset_n : std_logic;
        signal enable_n : std_logic;
        signal led : std_logic_vector(7 downto 0);
        -- Create aliases for the two counter outputs, adder-based and high level
        alias counter_adder : std_logic_vector(3 downto 0) is led (3 downto 0);
        alias counter_hl : std_logic_vector(3 downto 0) is led(7 downto 4);



begin
        
        -- Create clk
        clk <= not clk after clk_period/2 when clk_enable else '0';
        
        -- Instantiate design under test
        dut: entity work.counter(rtl)
        port map(
                clk => clk,
                reset_n => reset_n,
                enable_n => enable_n,
                led => led
                );

        -- Provide the stimuli
        p_stimuli: process
                variable expected_value : std_logic_vector(3 downto 0);
        begin
                report "Starting simulation of counter.";
                -- default values
                enable_n <= '1';
                reset_n <= '1';
                clk_enable <= true;
                report "Reset counters";
                -- Synch to clock
                reset_n <= '0';
                wait for 200 ns;
                reset_n <= '1';
                wait for 100 ns;
                -- Check expected output value
                assert led = x"00"
                        report "Initial reset not correct"
                        severity warning;

                report "Loop through counter test values, and check for return to 0 on overflow";
                count_loop: for i in 1 to 18 loop
                        wait until rising_edge(clk);
                        enable_n <= '0';
                        wait for clk_period*6; -- Bring enable low for longer than 5 clk cycles
                        wait until rising_edge(clk);
                        enable_n <= '1';
                        -- wait for at least 2 clock periods to
                        -- allow the signal to propagate through 
                        -- the synchronization registers
                        wait for clk_period*3;
                        -- Convert counter value i to std_logic_vector 
                        -- for easy comparison. Use the 4 lower bits to test. This
                        -- will also automatically test the overflow condition
                        expected_value := std_logic_vector(to_unsigned(i,5)(3 downto 0));
                        -- Check if 
                        assert counter_adder = expected_value
                                report "Counter adder expected: " & to_string(expected_value) & ", was: " & to_string(counter_adder)
                                severity warning;
                        assert counter_hl = expected_value
                                report "Counter high level expected: " & to_string(expected_value) & ", was: " & to_string(counter_hl)
                                severity warning;
                end loop;

                
                report "Reset counters";
                -- Synch to clock
                reset_n <= '0';
                wait for 200 ns;
                reset_n <= '1';
                wait for 100 ns;
                -- Check expected output value
                assert led = x"00"
                        report "Initial reset not correct"
                        severity warning;
                report "End simulation";
                clk_enable <= false;
                wait;

        end process;


end architecture;
