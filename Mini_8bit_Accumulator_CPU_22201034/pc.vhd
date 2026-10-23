
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        en     : in  STD_LOGIC;
        PC_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end pc;

architecture Structural of pc is

    signal pc_current : STD_LOGIC_VECTOR(3 downto 0);
    signal pc_next    : STD_LOGIC_VECTOR(3 downto 0);
    signal carry_out  : STD_LOGIC;

begin

    -- 4-bit full adder: PC + 1
    PC_ADDER: entity work.full_adder_4bit
        port map (
            A    => pc_current,
            B    => "0001",
            Cin  => '0',
            Sum  => pc_next,
            Cout => carry_out
        );

    -- 4-bit register stores the updated PC
    PC_REGISTER: entity work.register_4bit
        port map (
            clk   => clk,
            reset => reset,
            en    => en,
            D     => pc_next,
            Q     => pc_current
        );

    -- Current PC output
    PC_out <= pc_current;

end Structural;