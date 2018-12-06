library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux16 is
	port(
		input0 : in  std_logic_vector(15 downto 0);
		input1 : in  std_logic_vector(15 downto 0);
		sel    : in  std_logic;
		output : out std_logic_vector(15 downto 0)
	);
end entity Mux16;

architecture RTL of Mux16 is

begin

	with sel select output <=
		input0 when '0',
		input1 when '1',
	input0 when others;

end architecture RTL;
