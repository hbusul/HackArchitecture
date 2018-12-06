library ieee;
use ieee.std_logic_1164.all;
entity DMux4Way_tb is
end DMux4Way_tb;

library ieee;
use ieee.std_logic_1164.all;
architecture behav of DMux4Way_tb is
	type pattern_type is record
		input : std_logic;
		sel : std_logic_vector(1 downto 0);
		output : std_logic_vector(3 downto 0);
	end record;

	type pattern_array is array (natural range <>) of pattern_type;
	component DMux4Way
		port(
			sel    : in  std_logic_vector(1 downto 0);
			input  : in  std_logic;
			output : out std_logic_vector(3 downto 0)
		);
	end component DMux4Way;
	

	signal s_input : std_logic;
	signal s_sel : std_logic_vector(1 downto 0);
	signal s_output : std_logic_vector(3 downto 0);

begin
	Dmux_0 : DMux4Way
		port map(
			sel   => s_sel,
			input => s_input,
			output => s_output
		);

	process
		constant patterns : pattern_array := (
			('0', "00", "0000"),
			('0', "01", "0000"),
			('0', "10", "0000"),
			('0', "11", "0000"),
			('1', "00", "0001"),
			('1', "01", "0010"),
			('1', "10", "0100"),
			('1', "11", "1000")
		);

	begin
		for i in patterns'range loop
			s_input  <= patterns(i).input;
			s_sel <= patterns(i).sel;
			wait for 1 ns;

			assert s_output = patterns(i).output
			report "bad output" severity error;

		end loop;
		assert false report "end of test" severity note;
		wait;
	end process;
end behav;
