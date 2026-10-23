
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z_flag is
    Port (
        clk       : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        en        : in  STD_LOGIC;
        alu_result : in  STD_LOGIC_VECTOR(7 downto 0);
        Z          : out STD_LOGIC
    );
end z_flag;

architecture Structural of z_flag is

    signal zero_detected : STD_LOGIC;
    signal z_current     : STD_LOGIC;

begin

    -- Detect whether the ALU result is zero
    zero_detected <= '1' when alu_result = "00000000" else '0';

    -- Store the zero flag using the existing 1-bit register
    Z_REGISTER: entity work.register_1bit
        port map (
            clk   => clk,
            reset => reset,
            en    => en,
            D     => zero_detected,
            Q     => z_current
        );

    Z <= z_current;

end Structural;