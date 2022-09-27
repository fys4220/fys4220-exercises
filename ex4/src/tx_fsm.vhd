library ieee;
use ieee.std_logic_1164.all;


entity tx_fsm is
        port(
                signal clk : in std_logic;
                signal areset_n : in std_logic;
                signal tx_data_valid : in std_logic;
                signal tx_complete : in std_logic;
                signal tx_enable: out std_logic;
                signal tx_busy : out std_logic

            );
end entity;

architecture rtl of tx_fsm is
        type t_state is (sIDLE, sTRANSMIT);
        signal state : t_state;
        

begin


        p_fsm: process(areset_n, clk)
        begin
                if areset_n = '0' then
                        state <= sIDLE;
                        tx_enable <= '0';
                        tx_busy <= '0';
                elsif rising_edge(clk) then
                        tx_enable <= '0';
                        tx_busy <= '0';
                        case state is
                                when sIDLE =>
                                        if tx_data_valid  = '1' then
                                                state <= sTRANSMIT;
                                        end if;
                                when sTRANSMIT =>
                                        tx_busy <= '1';
                                        tx_enable <= '1';
                                        if tx_complete = '1' then
                                                state <= sIDLE;
                                        end if;
                                when others =>
                                        state <= sIDLE;
                        end case;
                end if;

        end process;

end architecture;
