library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
        port(
                clk: in std_logic;
                reset_n: in std_logic;
                enable_n: in std_logic;
                led: out std_logic_vector(7 downto 0)
            );
end entity;


architecture rtl of counter is
        -- Counter signals, one for the adder based,
        -- and one for the high level version
        signal counter_adder : std_logic_vector(3 downto 0);
        signal sum_i :  std_logic_vector(3 downto 0);
        signal counter_hl : unsigned(3 downto 0);
        -- synchronization signals for enable
        signal enable_r1_n : std_logic;
        signal enable_r2_n : std_logic;
        signal enable_r3_n : std_logic;
        -- Synchronization signals for reset
        signal reset_r1_n : std_logic;
        signal reset_r2_n : std_logic;
        -- Internal enable signal for counters
        signal enable_i : std_logic;



begin
        -- Fixed connections to bring the counter values
        --  out to the LEDs
        led(3 downto 0) <= counter_adder;
        led(7 downto 4) <= std_logic_vector(counter_hl);

        -- instantiate a 4-bit addder
        adder: entity work.adder_nbit(rtl)
        generic map(no_bits => 4)
        port map(
                A => counter_adder,
                B => "0001",
                SUM => SUM_i,
                COUT => open
                );
        
        -- synchronize reset and enable signals and add edge detection register
        -- for enable
        p_sync: process(clk)
        begin
                if rising_edge(clk) then
                        enable_r1_n <= enable_n; -- Synch. reg 1
                        enable_r2_n <= enable_r1_n; -- Synch. reg 2
                        enable_r3_n <= enable_r2_n; -- Edge detection reg.
                        -- reset
                        reset_r1_n <= reset_n;
                        reset_r2_n <= reset_r1_n;

                end if;
        end process;

        -- Create pulse on falling edge
        enable_i <= enable_r3_n and not enable_r2_n;

        -- Register for adder based counter
        process(clk) is
        begin
                if rising_edge(clk) then
                        if reset_r2_n= '0' then
                                counter_adder <= (others => '0');
                        elsif enable_i = '1' then
                                counter_adder <= sum_i;
                        end if;
                end if;
        end process;

        -- high level unsigned counter
        process(clk) is
        begin
                if rising_edge(clk) then
                        if reset_r2_n = '0' then
                                counter_hl <= (others => '0');
                        elsif enable_i = '1' then
                                counter_hl <= counter_hl + 1;
                        end if;
                end if;
        end process;


end architecture;

