
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cpu is
end tb_cpu;

architecture Behavioral of tb_cpu is

    -- Testbench inputs
    signal clk    : STD_LOGIC := '0';
    signal reset  : STD_LOGIC := '1';

    -- CPU outputs
    signal PC_out : STD_LOGIC_VECTOR(3 downto 0);
    signal Q      : STD_LOGIC_VECTOR(7 downto 0);
    signal Z      : STD_LOGIC;
    signal R_out  : STD_LOGIC_VECTOR(7 downto 0);

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instantiate the complete CPU
    DUT: entity work.cpu_top
        port map (
            clk    => clk,
            reset  => reset,
            PC_out => PC_out,
            Q      => Q,
            Z      => Z,
            R_out  => R_out
        );

    -- Generate clock
    clock_process: process
    begin
        while now < 2000 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Apply reset and run the CPU
    stimulus_process: process
    begin
        reset <= '1';
        wait for 40 ns;

        reset <= '0';

        -- Allow the CPU to execute the program
        wait for 320 ns;

        -- End simulation
        assert false
            report "CPU simulation completed."
            severity failure;

        wait;
    end process;

end Behavioral;