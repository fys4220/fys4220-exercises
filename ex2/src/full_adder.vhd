library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        A : in std_logic;
        B : in std_logic;
        cin : in std_logic;
        sum : out std_logic;
        cout : out std_logic
    );
end entity;


architecture rtl of full_adder is

    signal cout1 : std_logic;
    signal cout2 : std_logic;
    signal sum1 : std_logic;
   
begin

    comp_ha1 : entity work.half_adder(rtl)
        port map(
            A => A, 
            B => B,
            sum => sum1,
            cout => cout1
        );

    comp_ha2: entity work.half_adder(rtl)
        port map(
            A => sum1, 
            B => cin,
            sum => sum,
            cout => cout2
        );

    cout <= cout1 or cout2;

end architecture;
