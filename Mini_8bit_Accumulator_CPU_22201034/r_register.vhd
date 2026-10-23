
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity r_register is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        en    : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end r_register;

architecture Structural of r_register is

    signal r_data : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Reuse the existing 8-bit register
    R_STORAGE: entity work.register_8bit
        port map (
            clk   => clk,
            reset => reset,
            en    => en,
            D     => D,
            Q     => r_data
        );

    Q <= r_data;

end Structural;