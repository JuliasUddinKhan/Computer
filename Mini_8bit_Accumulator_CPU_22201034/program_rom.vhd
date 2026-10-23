
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity program_rom is
    Port (
        address     : in  STD_LOGIC_VECTOR(3 downto 0);
        instruction : out STD_LOGIC_VECTOR(11 downto 0)
    );
end program_rom;

architecture Behavioral of program_rom is
begin

    process(address)
    begin
        case address is

            when "0000" =>
                instruction <= "000100000001"; -- LDI 1

            when "0001" =>
                instruction <= "000100000010"; -- LDI 2

            when "0010" =>
                instruction <= "001000000011"; -- ADD 3

            when "0011" =>
                instruction <= "101000000000"; -- STA

            when "0100" =>
                instruction <= "000100001111"; -- LDI 15

            when "0101" =>
                instruction <= "101100000000"; -- LDR

            when "0110" =>
                instruction <= "010000000011"; -- AND 3

            when others =>
                instruction <= "111100000000"; -- NOP

        end case;
    end process;

end Behavioral;