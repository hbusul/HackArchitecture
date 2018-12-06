library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DMux is
	 	port(input : in std_logic;
			sel : in std_logic;
			output : out std_logic_vector(1 downto 0)
		);
end entity DMux;

architecture RTL of DMux is

begin
	output(0) <= (not sel) and input;
	output(1) <= sel and input;
end architecture RTL;