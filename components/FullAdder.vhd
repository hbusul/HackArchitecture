library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FullAdder is
	port(
		a, b, c    : in  std_logic;
		sum, carry : out std_logic
	);
end entity FullAdder;

architecture RTL of FullAdder is

begin
	sum   <= (a xor b) xor c;
	carry <= (a and b) or (b and c) or (a and c);
end architecture RTL;
