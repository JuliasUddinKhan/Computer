
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    Port (
        A        : in  STD_LOGIC_VECTOR(7 downto 0);
        B        : in  STD_LOGIC_VECTOR(7 downto 0);
        add_en   : in  STD_LOGIC;
        and_en   : in  STD_LOGIC;
        Result   : out STD_LOGIC_VECTOR(7 downto 0);
        CarryOut : out STD_LOGIC
    );
end alu;

architecture Structural of alu is

    signal add_result : STD_LOGIC_VECTOR(7 downto 0);
    signal and_result : STD_LOGIC_VECTOR(7 downto 0);
    signal add_carry  : STD_LOGIC;

begin

    -- Reuse the 8-bit full adder for addition
    ADDER: entity work.full_adder_8bit
        port map (
            A    => A,
            B    => B,
            Cin  => '0',
            Sum  => add_result,
            Cout => add_carry
        );

    -- Bitwise AND operation
    and_result <= A AND B;

    -- Select the ALU operation
    process(A, B, add_en, and_en, add_result, and_result, add_carry)
    begin
        Result   <= (others => '0');
        CarryOut <= '0';

        if add_en = '1' then
            Result   <= add_result;
            CarryOut <= add_carry;

        elsif and_en = '1' then
            Result   <= and_result;
            CarryOut <= '0';
        end if;
    end process;

end Structural;