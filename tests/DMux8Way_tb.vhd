library ieee;
use ieee.std_logic_1164.all;
entity DMux8Way_tb is
end DMux8Way_tb;

library ieee;
use ieee.std_logic_1164.all;
architecture behav of DMux8Way_tb is
	type pattern_type is record
		input : std_logic;
		sel : std_logic_vector(2 downto 0);
		output : std_logic_vector(7 downto 0);
	end record;

	type pattern_array is array (natural range <>) of pattern_type;
	component DMux8Way
		port(
			sel    : in  std_logic_vector(2 downto 0);
			input  : in  std_logic;
			output : out std_logic_vector(7 downto 0)
		);
	end component DMux8Way;

	signal s_input : std_logic;
	signal s_output : std_logic_vector(7 downto 0);
	signal s_sel : std_logic_vector(2 downto 0);

begin
	Dmux_0 : DMux8Way
		port map(
			sel   => s_sel,
			input => s_input,
			output => s_output
		);

	process
		constant patterns : pattern_array := (
			('0', "000", "00000000"),
			('0', "001", "00000000"),
			('0', "010", "00000000"),
			('0', "011", "00000000"),
			('0', "100", "00000000"),
			('0', "101", "00000000"),
			('0', "110", "00000000"),
			('0', "111", "00000000"),
			('1', "000", "00000001"),
			('1', "001", "00000010"),
			('1', "010", "00000100"),
			('1', "011", "00001000"),
			('1', "100", "00010000"),
			('1', "101", "00100000"),
			('1', "110", "01000000"),
			('1', "111", "10000000")
		);

	begin
		for i in patterns'range loop
			s_input  <= patterns(i).input;
			s_sel  <= patterns(i).sel;
			wait for 1 ns;

			assert s_output = patterns(i).output
			report "bad output out a" severity error;

	
		end loop;
		assert false report "end of test" severity note;
		wait;
	end process;
end behav;
