library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HalfAdder is
	port(
		a, b : in std_logic;
		sum, carry : out std_logic
	);
end entity HalfAdder;

architecture RTL of HalfAdder is
begin
	carry <= a and b;
	sum  <= a xor b;
end architecture RTL;