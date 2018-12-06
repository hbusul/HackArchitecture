library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Equ16_tb is
end entity Equ16_tb;

architecture behav of Equ16_tb is
	signal s_input0 : std_logic_vector(15 downto 0);
	signal s_input1 : std_logic_vector(15 downto 0);
	signal s_output : std_logic;

	type pattern_type is record
		input0 : std_logic_vector(15 downto 0);
		input1 : std_logic_vector(15 downto 0);
		output : std_logic;
	end record;

	type pattern_array is array (natural range <>) of pattern_type;

	component Equ16
		port(
			value0, value1 : in  std_logic_vector(15 downto 0);
			equal          : out std_logic
		);
	end component Equ16;

begin
	equ0 : component Equ16
		port map(
			value0 => s_input0,
			value1 => s_input1,
			equal  => s_output
		);

	process
		constant patterns : pattern_array := (
			("0000000000000000", "0000000000000001", '0'),
			("0101010111110111", "0101010111111000", '0'),
			("0101010111111111", "0101011000000000", '0'),
			("1111111111111111", "0000000000000000", '0'),
			("1011101101110000", "1011101101110001", '0'),
			("1111101101110001", "1011101101110001", '0'),
			("1101000110101011", "0101000110101011", '0'),
			("0101000111101011", "0101000110101011", '0'),
			("1011101101110001", "1011101101110001", '1'),
			("1111111111111111", "1111111111111111", '1'),
			("0000000000000000", "0000000000000000", '1'),
			("1111111001111111", "1111111001111111", '1'),
			("1110111001111111", "1110111001111111", '1'),
			("0101000110101011", "0101000110101011", '1'),
			("0101111111111111", "0101111111111111", '1'),
			("0101111111100000", "0101111111100000", '1')
		);
	begin
		for i in patterns'range loop
			s_input0 <= patterns(i).input0;
			s_input1 <= patterns(i).input1;
			wait for 1 ns;
			assert s_output = patterns(i).output
			report "bad output" severity error;
		end loop;

		assert false report "end of test" severity note;
		wait;

	end process;

end architecture behav;
