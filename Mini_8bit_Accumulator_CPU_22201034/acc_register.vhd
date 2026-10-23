
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc_register is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        en    : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end acc_register;

architecture Structural of acc_register is

    signal acc_data : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Reuse the existing 8-bit register
    ACC_STORAGE: entity work.register_8bit
        port map (
            clk   => clk,
            reset => reset,
            en    => en,
            D     => D,
            Q     => acc_data
        );

    Q <= acc_data;

end Structural;