library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_4bit_tb is
end entity;



architecture tb of adder_4bit_tb is
        signal A : std_logic_vector(3 downto 0);
        signal B : std_logic_vector(3 downto 0);
        signal SUM : std_logic_vector(3 downto 0);
        --signal CIN : std_logic;
        signal COUT : std_logic;


begin

        dut: entity work.adder_4bit(rtl) -- Check nbit version
        port map(
                A => A,
                B => B,
                --CIN => CIN,
                SUM => SUM,
                COUT => COUT
                );

        p_stimuli: process
                variable sum_ab : unsigned(4 downto 0) := (others => '0'); 

        begin
                report "Starting simulation, running through all combinations of A, B and CIN";
                for ia in 0 to 15 loop
                        A <= std_logic_vector(to_unsigned(ia,4));
                        for ib in 0 to 15 loop
                                B <= std_logic_vector(to_unsigned(ib,4));
                                sum_ab := to_unsigned(ia,5) + to_unsigned(ib,5);
                                wait for 5 ns;
                                assert (COUT & SUM) = std_logic_vector(sum_ab)
                                        report "Incorrect values: (COUT & SUM)=" & to_string(COUT & SUM) & 
                                        ", expected: " & to_string(sum_ab)
                                        severity warning;
                        end loop;
                end loop;
                report "Simulation completed!";
                wait;

        end process;

end architecture;
