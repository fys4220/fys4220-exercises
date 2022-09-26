library ieee;
use ieee.std_logic_1164.all;


entity tx_fsm_tb is
end entity;

architecture tb of tx_fsm_tb is
        -- Clock related signals
        signal clk : std_logic;
        signal clk_ena : boolean := false;
        signal clk_period : time := 20 ns;

        -- reset signals
        signal areset_n : std_logic;

        -- Module specific signals
        signal tx_data_valid : std_logic;
        signal tx_complete : std_logic;
        signal tx_enable : std_logic;
        signal tx_busy : std_logic;

begin
        -- Instantiate design under test
        dut: entity work.tx_fsm(rtl)
        port map(
                clk => clk,
                areset_n => areset_n,
                tx_data_valid => tx_data_valid,
                tx_complete => tx_complete,
                tx_enable => tx_enable,
                tx_busy => tx_busy
                );

        -- Create clock
        clk <= not clk after clk_period/2 when clk_ena else '0';
        
        -- Generate test stimuli
        p_stimuli: process
        begin
                report "Starting simulation";
                -- default values
                areset_n <= '1';
                tx_complete <= '0';
                tx_data_valid <= '0';
                report "Enabling clock and reset"; 
                clk_ena <= true;
                areset_n <= '0';
                wait for clk_period * 2;
                areset_n <= '1';
                -- Expect state machine to go to idle
                -- state on next rising edge clk. Wait until an
                -- event on one of the signals, timeout after 2
                -- clock periods
                wait until tx_busy'event for clk_period*2;

                -- Check for expected output in idle
                assert tx_busy = '0'
                        report "tx_busy actcive!"
                        severity warning;
                assert tx_enable = '0'
                        report "tx_enable actcive!"
                        severity warning;


                wait for 100 ns;
                -- Set signals synchronous to the rising edge
                wait until rising_edge(clk);
                report "Activating state machine";
                tx_data_valid <= '1';
                wait until rising_edge(clk);
                tx_data_valid <= '0';
        

                -- Expect that tx_busy and tx_enable goes high 
                -- after 1 clock cycle
                wait until tx_busy'event for clk_period*2;
                assert tx_busy = '1'
                        report "tx_busy not actcive!"
                        severity warning;
                assert tx_enable = '1'
                        report "tx_enable not actcive!"
                        severity warning;
                wait for 0 ns; 

                
                -- wait for some clock cycles
                wait for clk_period * 5;
                wait until rising_edge(clk);
                tx_complete <= '1';
                wait until rising_edge(clk);
                tx_complete <= '0';
                -- check for expected values in idel                

                wait until tx_busy'event for clk_period*2;
                assert tx_busy = '0'
                        report "tx_busy active"
                        severity warning;
                assert tx_enable = '0'
                        report "tx_enable active!"
                        severity warning;
                wait for 0 ns; 

                report "Disabling clock"; 
                clk_ena <= false;
                wait;

        end process;




end architecture;
