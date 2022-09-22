library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_nbit_tb is
end entity;



architecture tb of adder_nbit_tb is
        constant no_bits : integer := 4;
        signal A : std_logic_vector(no_bits-1 downto 0);
        signal B : std_logic_vector(no_bits-1 downto 0);
        signal SUM : std_logic_vector(no_bits-1 downto 0);
        signal COUT : std_logic;


begin

        dut: entity work.adder_nbit(rtl) -- Check nbit version
        generic map(no_bits => no_bits)
        port map(
                A => A,
                B => B,
                SUM => SUM,
                COUT => COUT
                );

        p_stimuli: process
                variable sum_ab : unsigned(no_bits downto 0) := (others => '0'); 

        begin
                report "Starting simulation, running through all combinations of A, B";
                for ia in 0 to 2**no_bits-1 loop
                        A <= std_logic_vector(to_unsigned(ia,no_bits));
                        for ib in 0 to 2**no_bits-1 loop
                                B <= std_logic_vector(to_unsigned(ib,no_bits));
                                sum_ab := to_unsigned(ia,no_bits+1) + to_unsigned(ib,no_bits+1);
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
