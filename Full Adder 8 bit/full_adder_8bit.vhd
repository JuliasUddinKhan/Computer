
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_8bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        SUM  : out STD_LOGIC_VECTOR(7 downto 0);
        COUT : out STD_LOGIC
    );
end full_adder_8bit;

architecture Structural of full_adder_8bit is

    -- Your existing 1-bit Full Adder
    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            SUM  : out STD_LOGIC;
            COUT : out STD_LOGIC
        );
    end component;

    -- Carry signals between the 8 Full Adders
    signal C : STD_LOGIC_VECTOR(8 downto 0);

begin

    -- Initial carry
    C(0) <= Cin;

    -- Bit 0
    FA0: full_adder
        port map (
            A    => A(0),
            B    => B(0),
            Cin  => C(0),
            SUM  => SUM(0),
            COUT => C(1)
        );

    -- Bit 1
    FA1: full_adder
        port map (
            A    => A(1),
            B    => B(1),
            Cin  => C(1),
            SUM  => SUM(1),
            COUT => C(2)
        );

    -- Bit 2
    FA2: full_adder
        port map (
            A    => A(2),
            B    => B(2),
            Cin  => C(2),
            SUM  => SUM(2),
            COUT => C(3)
        );

    -- Bit 3
    FA3: full_adder
        port map (
            A    => A(3),
            B    => B(3),
            Cin  => C(3),
            SUM  => SUM(3),
            COUT => C(4)
        );

    -- Bit 4
    FA4: full_adder
        port map (
            A    => A(4),
            B    => B(4),
            Cin  => C(4),
            SUM  => SUM(4),
            COUT => C(5)
        );

    -- Bit 5
    FA5: full_adder
        port map (
            A    => A(5),
            B    => B(5),
            Cin  => C(5),
            SUM  => SUM(5),
            COUT => C(6)
        );

    -- Bit 6
    FA6: full_adder
        port map (
            A    => A(6),
            B    => B(6),
            Cin  => C(6),
            SUM  => SUM(6),
            COUT => C(7)
        );

    -- Bit 7
    FA7: full_adder
        port map (
            A    => A(7),
            B    => B(7),
            Cin  => C(7),
            SUM  => SUM(7),
            COUT => C(8)
        );

    -- Final carry
    COUT <= C(8);

end Structural;
