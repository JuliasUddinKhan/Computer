library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_8bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end full_adder_8bit;

architecture Structural of full_adder_8bit is
    signal C4 : STD_LOGIC;
begin

    -- Lower 4-bit adder
    FA_LOW: entity work.full_adder_4bit
        port map (
            A    => A(3 downto 0),
            B    => B(3 downto 0),
            Cin  => Cin,
            Sum  => Sum(3 downto 0),
            Cout => C4
        );

    -- Upper 4-bit adder
    FA_HIGH: entity work.full_adder_4bit
        port map (
            A    => A(7 downto 4),
            B    => B(7 downto 4),
            Cin  => C4,
            Sum  => Sum(7 downto 4),
            Cout => Cout
        );

end Structural;