library ieee;
use ieee.std_logic_1164.all;

entity ex1 is
        port(
                sw: in std_logic_vector(7 downto 0);
                led: out std_logic_vector(7 downto 0)
        );
end entity;

architecture rtl of ex1 is
begin

        led <= sw;

end architecture;
