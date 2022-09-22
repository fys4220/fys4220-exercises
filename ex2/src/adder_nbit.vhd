library ieee;
use ieee.std_logic_1164.all;

entity adder_nbit is
        generic(
                no_bits : integer := 4
               );
        port(
                A : in std_logic_vector(no_bits-1 downto 0);
                B : in std_logic_vector(no_bits-1 downto 0);
                SUM : out std_logic_vector(no_bits-1 downto 0);
                COUT : out std_logic
            );
end entity;


architecture rtl of adder_nbit is

signal cin_i : std_logic_vector(no_bits + 1 downto 0);

begin
        g_adder: for i in 0 to no_bits-1 generate
                ab0: entity work.full_adder(rtl)
                port map(
                        A => A(i),
                        B => B(i),
                        CIN => cin_i(i),
                        SUM => SUM(i),
                        COUT => cin_i(i+1)
                );
        end generate;

        cout <= cin_i(no_bits);
        cin_i(0) <= '0';        

end architecture;



