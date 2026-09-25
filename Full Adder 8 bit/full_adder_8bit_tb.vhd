
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_8bit_tb IS
END full_adder_8bit_tb;

ARCHITECTURE behavior OF full_adder_8bit_tb IS

    COMPONENT full_adder_8bit
    PORT(
        A    : IN  STD_LOGIC_VECTOR(7 downto 0);
        B    : IN  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : IN  STD_LOGIC;
        SUM  : OUT STD_LOGIC_VECTOR(7 downto 0);
        COUT : OUT STD_LOGIC
    );
    END COMPONENT;

    signal A    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal B    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal Cin  : STD_LOGIC := '0';

    signal SUM  : STD_LOGIC_VECTOR(7 downto 0);
    signal COUT : STD_LOGIC;

BEGIN

    uut: full_adder_8bit PORT MAP (
        A    => A,
        B    => B,
        Cin  => Cin,
        SUM  => SUM,
        COUT => COUT
    );

    stim_proc: process
    begin

        -- Test 1: 1 + 1 = 2
        A <= "00000001";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Test 2: 5 + 3 = 8
        A <= "00000101";
        B <= "00000011";
        Cin <= '0';
        wait for 100 ns;

        -- Test 3: 10 + 5 = 15
        A <= "00001010";
        B <= "00000101";
        Cin <= '0';
        wait for 100 ns;

        -- Test 4: 15 + 1 = 16
        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Test 5: 100 + 50 = 150
        A <= "01100100";
        B <= "00110010";
        Cin <= '0';
        wait for 100 ns;

        -- Test 6: 170 + 85 = 255
        A <= "10101010";
        B <= "01010101";
        Cin <= '0';
        wait for 100 ns;

        -- Test 7: 255 + 1 = 256
        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Test 8: 255 + 255 + 1 = 511
        A <= "11111111";
        B <= "11111111";
        Cin <= '1';
        wait for 100 ns;

        wait;

    end process;

END;
