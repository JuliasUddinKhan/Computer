
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port (
        instruction : in  STD_LOGIC_VECTOR(11 downto 0);

        ldi_en      : out STD_LOGIC;
        add_en      : out STD_LOGIC;
        sta_en      : out STD_LOGIC;
        ldr_en      : out STD_LOGIC;
        and_en      : out STD_LOGIC;
        nop_en      : out STD_LOGIC
    );
end control_unit;

architecture Behavioral of control_unit is
    signal opcode : STD_LOGIC_VECTOR(3 downto 0);
begin

    -- Extract the 4-bit opcode
    opcode <= instruction(11 downto 8);

    -- Decode the instruction
    process(opcode)
    begin
        ldi_en <= '0';
        add_en <= '0';
        sta_en <= '0';
        ldr_en <= '0';
        and_en <= '0';
        nop_en <= '0';

        case opcode is
            when "0001" =>
                ldi_en <= '1';  -- LDI

            when "0010" =>
                add_en <= '1';  -- ADD

            when "0100" =>
                and_en <= '1';  -- AND

            when "1010" =>
                sta_en <= '1';  -- STA

            when "1011" =>
                ldr_en <= '1';  -- LDR

            when others =>
                nop_en <= '1';  -- NOP / unsupported opcode
        end case;
    end process;

end Behavioral;