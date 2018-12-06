--  A testbench has no ports.
entity Mux16_tb is
end Mux16_tb;

library ieee;
use ieee.std_logic_1164.all;
architecture behav of Mux16_tb is
	type pattern_type is record
		input0 : std_logic_vector(15 downto 0);
		input1 : std_logic_vector(15 downto 0);
		sel     : std_logic;
		output  : std_logic_vector(15 downto 0);
	end record;

	type pattern_array is array (natural range <>) of pattern_type;

	component Mux16
		port(
			input0 : in  std_logic_vector(15 downto 0);
			input1 : in  std_logic_vector(15 downto 0);
			sel     : in  std_logic;
			output  : out std_logic_vector(15 downto 0)
		);
	end component Mux16;

	signal s_input0 : std_logic_vector(15 downto 0);
	signal s_input1 : std_logic_vector(15 downto 0);
	signal s_sel    : std_logic;
	signal s_output : std_logic_vector(15 downto 0);

begin
	mux0 : component Mux16
		port map(
			input0 => s_input0,
			input1 => s_input1,
			sel     => s_sel,
			output  => s_output
		);

	process
		constant patterns : pattern_array := (
			("0000000000000000", "0000000000000000", '0', "0000000000000000"),
			("0000000000000000", "0000000000000000", '1', "0000000000000000"),
			("1111111111111111", "1111111111111111", '0', "1111111111111111"),
			("1111111111111111", "1111111111111111", '1', "1111111111111111"),
			("0000000000000000", "1111111111111111", '0', "0000000000000000"),
			("0000000000000000", "1111111111111111", '1', "1111111111111111"),
			("1111111111111111", "0000000000000000", '0', "1111111111111111"),
			("1111111111111111", "0000000000000000", '1', "0000000000000000"),
			("1010101010110111", "0000000000000000", '0', "1010101010110111"),
			("1010101010110111", "0000000000000000", '1', "0000000000000000"),
			("1010101010110111", "1111111111111111", '0', "1010101010110111"),
			("1010101010110111", "1111111111111111", '1', "1111111111111111"),
			("1101001010101010", "0010010100001110", '0', "1101001010101010"),
			("1101001010101010", "0010010100001110", '1', "0010010100001110"),
			("0000000011111111", "1111111100000000", '0', "0000000011111111"),
			("0000000011111111", "1111111100000000", '1', "1111111100000000")
		);

	begin
		for i in patterns'range loop
			s_input0 <= patterns(i).input0;
			s_input1 <= patterns(i).input1;
			s_sel   <= patterns(i).sel;
			wait for 1 ns;
			assert s_output = patterns(i).output
			report "bad output" severity error;
		end loop;
		assert false report "end of test" severity note;
		wait;
	end process;
end behav;
