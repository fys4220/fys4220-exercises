library ieee;
use ieee.std_logic_1164.all;

entity adder_4bit is
        port(
                A : in std_logic_vector(3 downto 0);
                B : in std_logic_vector(3 downto 0);
                SUM : out std_logic_vector(3 downto 0);
                COUT : out std_logic
            );
end entity;


architecture rtl of adder_4bit is

signal cout_i : std_logic_vector(3 downto 0);

begin
        COUT <= cout_i(3);
        ab0: entity work.full_adder(rtl)
        port map(
                        A => A(0),
                        B => B(0),
                        CIN => '0',
                        SUM => SUM(0),
                        COUT => cout_i(0)
                );

        ab1: entity work.full_adder(rtl)
        port map(
                        A => A(1),
                        B => B(1),
                        CIN => cout_i(0),
                        SUM => SUM(1),
                        COUT => cout_i(1)
                );

        ab2: entity work.full_adder(rtl)
        port map(
                        A => A(2),
                        B => B(2),
                        CIN => cout_i(1),
                        SUM => SUM(2),
                        COUT => cout_i(2)
                );
      
        ab3: entity work.full_adder(rtl)
        port map(
                        A => A(3),
                        B => B(3),
                        CIN => cout_i(2),
                        SUM => SUM(3),
                        COUT => cout_i(3)
                );

end architecture;
