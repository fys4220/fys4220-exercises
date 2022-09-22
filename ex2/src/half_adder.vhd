library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
        port(
                    A : in std_logic;
                    B : in std_logic;
                    SUM : out std_logic;
                    COUT : out std_logic
            );
end entity;


architecture rtl of half_adder is
begin

        SUM <= A xor B;
        COUT <= A and B;

end architecture;

