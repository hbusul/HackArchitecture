library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Inc16_tb is
end entity Inc16_tb;

architecture behav of Inc16_tb is
	signal s_input  : std_logic_vector(15 downto 0);
	signal s_output : std_logic_vector(15 downto 0);

	type pattern_type is record
		input  : std_logic_vector(15 downto 0);
		output : std_logic_vector(15 downto 0);
	end record;

	type pattern_array is array (natural range <>) of pattern_type;

	component Inc16
		port(
			input  : in  std_logic_vector(15 downto 0);
			output : out std_logic_vector(15 downto 0)
		);
	end component Inc16;

begin
	inc0 : component Inc16
		port map(
			input  => s_input,
			output => s_output
		);

	process
		constant patterns : pattern_array := (
			("0000000000000000", "0000000000000001"),
			("0101010111110111", "0101010111111000"),
			("0101010111111111", "0101011000000000"),
			("1111111111111111", "0000000000000000"),
			("1011101101110000", "1011101101110001")
		);
	begin
		
		for i in patterns'range loop
			s_input <= patterns(i).input;
			wait for 1 ns;
			assert s_output = patterns(i).output
			report "bad output" severity error;
		end loop;
		
		assert false report "end of test" severity note;
		wait;
		
	end process;

end architecture behav;
