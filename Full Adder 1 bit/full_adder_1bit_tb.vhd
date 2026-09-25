
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE behavior OF full_adder_tb IS

    COMPONENT full_adder
    PORT(
        A    : IN  STD_LOGIC;
        B    : IN  STD_LOGIC;
        Cin  : IN  STD_LOGIC;
        SUM  : OUT STD_LOGIC;
        COUT : OUT STD_LOGIC
    );
    END COMPONENT;

    signal A    : STD_LOGIC := '0';
    signal B    : STD_LOGIC := '0';
    signal Cin  : STD_LOGIC := '0';
    signal SUM  : STD_LOGIC;
    signal COUT : STD_LOGIC;

BEGIN

    uut: full_adder PORT MAP (
        A    => A,
        B    => B,
        Cin  => Cin,
        SUM  => SUM,
        COUT => COUT
    );

    stim_proc: process
    begin

        A <= '0'; B <= '0'; Cin <= '0';
        wait for 100 ns;

        A <= '0'; B <= '0'; Cin <= '1';
        wait for 100 ns;

        A <= '0'; B <= '1'; Cin <= '0';
        wait for 100 ns;

        A <= '0'; B <= '1'; Cin <= '1';
        wait for 100 ns;

        A <= '1'; B <= '0'; Cin <= '0';
        wait for 100 ns;

        A <= '1'; B <= '0'; Cin <= '1';
        wait for 100 ns;

        A <= '1'; B <= '1'; Cin <= '0';
        wait for 100 ns;

        A <= '1'; B <= '1'; Cin <= '1';
        wait for 100 ns;

        wait;

    end process;

END;
