library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_1bit is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder_1bit;

architecture Dataflow of full_adder_1bit is
    signal XOR1_OUT : STD_LOGIC;
    signal AND1_OUT : STD_LOGIC;
    signal AND2_OUT : STD_LOGIC;
begin

    -- XOR gates generate the Sum
    XOR1_OUT <= A XOR B;
    Sum      <= XOR1_OUT XOR Cin;

    -- AND and OR gates generate the Carry-out
    AND1_OUT <= A AND B;
    AND2_OUT <= XOR1_OUT AND Cin;
    Cout     <= AND1_OUT OR AND2_OUT;

end Dataflow;