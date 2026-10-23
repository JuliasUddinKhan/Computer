
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_8bit is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        en    : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end register_8bit;

architecture Behavioral of register_8bit is
    signal q_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                q_reg <= (others => '0');
            elsif en = '1' then
                q_reg <= D;
            end if;
        end if;
    end process;

    Q <= q_reg;

end Behavioral;