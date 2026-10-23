
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_top is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        PC_out : out STD_LOGIC_VECTOR(3 downto 0);
        Q      : out STD_LOGIC_VECTOR(7 downto 0);
        Z      : out STD_LOGIC;
        R_out  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end cpu_top;

architecture Structural of cpu_top is

    signal pc_address   : STD_LOGIC_VECTOR(3 downto 0);
    signal instruction  : STD_LOGIC_VECTOR(11 downto 0);
    signal operand      : STD_LOGIC_VECTOR(7 downto 0);

    signal ldi_en       : STD_LOGIC;
    signal add_en       : STD_LOGIC;
    signal sta_en       : STD_LOGIC;
    signal ldr_en       : STD_LOGIC;
    signal and_en       : STD_LOGIC;
    signal nop_en       : STD_LOGIC;

    signal acc_q        : STD_LOGIC_VECTOR(7 downto 0);
    signal acc_d        : STD_LOGIC_VECTOR(7 downto 0);
    signal r_q          : STD_LOGIC_VECTOR(7 downto 0);
    signal alu_result   : STD_LOGIC_VECTOR(7 downto 0);
    signal carry_out    : STD_LOGIC;
    signal acc_en       : STD_LOGIC;
    signal z_en         : STD_LOGIC;

begin

    -- Program Counter
    PC_UNIT: entity work.pc
        port map (
            clk    => clk,
            reset  => reset,
            en     => '1',
            PC_out => pc_address
        );

    -- Program ROM
    ROM_UNIT: entity work.program_rom
        port map (
            address     => pc_address,
            instruction => instruction
        );

    operand <= instruction(7 downto 0);

    -- Control Unit
    CU_UNIT: entity work.control_unit
        port map (
            instruction => instruction,
            ldi_en      => ldi_en,
            add_en      => add_en,
            sta_en      => sta_en,
            ldr_en      => ldr_en,
            and_en      => and_en,
            nop_en      => nop_en
        );

    -- ALU
    ALU_UNIT: entity work.alu
        port map (
            A        => acc_q,
            B        => operand,
            add_en   => add_en,
            and_en   => and_en,
            Result   => alu_result,
            CarryOut => carry_out
        );

    -- Accumulator input selection
    process(ldi_en, ldr_en, add_en, and_en,
            operand, r_q, alu_result)
    begin
        acc_d <= acc_q;

        if ldi_en = '1' then
            acc_d <= operand;
        elsif ldr_en = '1' then
            acc_d <= r_q;
        elsif add_en = '1' or and_en = '1' then
            acc_d <= alu_result;
        end if;
    end process;

    acc_en <= ldi_en or ldr_en or add_en or and_en;
    z_en   <= add_en or and_en;

    -- Accumulator Register
    ACC_UNIT: entity work.acc_register
        port map (
            clk   => clk,
            reset => reset,
            en    => acc_en,
            D     => acc_d,
            Q     => acc_q
        );

    -- R Register: stores ACC during STA
    R_UNIT: entity work.r_register
        port map (
            clk   => clk,
            reset => reset,
            en    => sta_en,
            D     => acc_q,
            Q     => r_q
        );

    -- Zero Flag
    Z_UNIT: entity work.z_flag
        port map (
            clk        => clk,
            reset      => reset,
            en         => z_en,
            alu_result => alu_result,
            Z          => Z
        );

    -- External outputs
    PC_out <= pc_address;
    Q      <= acc_q;
    R_out  <= r_q;

end Structural;