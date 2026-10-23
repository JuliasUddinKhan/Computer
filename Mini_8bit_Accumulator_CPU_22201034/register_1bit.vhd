library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_1bit is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        en    : in  STD_LOGIC;
        D     : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end register_1bit;

architecture Behavioral of register_1bit is
    signal q_reg : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                q_reg <= '0';
            elsif en = '1' then
                q_reg <= D;
            end if;
        end if;
    end process;

    Q <= q_reg;

end Behavioral;