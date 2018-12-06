library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Equ16 is
	port(
		value0, value1 : in std_logic_vector(15 downto 0);
		equal : out std_logic
	);
end entity Equ16;

architecture RTL of Equ16 is
	signal s_xored : std_logic_vector(15 downto 0);
	signal s_not_equal : std_logic;
begin
	s_xored <= value0 xor value1;
	s_not_equal <= s_xored(0) or s_xored(1) or s_xored(2)
	or s_xored(3) or s_xored(4) or s_xored(5) or s_xored(6)
	or s_xored(7) or s_xored(8) or s_xored(9) or s_xored(10)
	or s_xored(11) or s_xored(12) or s_xored(13) or s_xored(14)
	or s_xored(15); 	
	equal <= not s_not_equal;

end architecture RTL;
