
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and_gate_tb IS
END and_gate_tb;

ARCHITECTURE behavior OF and_gate_tb IS

    COMPONENT and_gate
    PORT(
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
    END COMPONENT;

    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

BEGIN

    uut: and_gate PORT MAP (
        A => A,
        B => B,
        Y => Y
    );

    stim_proc: process
    begin

        -- 00 -> 0
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- 01 -> 0
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- 10 -> 0
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- 11 -> 1
        A <= '1';
        B <= '1';
        wait for 100 ns;

        wait;

    end process;

END;
