--  A testbench has no ports.
entity Mux_tb is
end Mux_tb;

library ieee;
use ieee.std_logic_1164.all;
architecture behav of Mux_tb is
	type pattern_type is record
		input : std_logic_vector(1 downto 0);
		sel, output : std_logic;
	end record;

	type pattern_array is array (natural range <>) of pattern_type;

	component Mux
		port(
			input  : in  std_logic_vector(1 downto 0);
			sel    : in  std_logic;
			output : out std_logic
		);
	end component Mux;

	signal s_input         : std_logic_vector(1 downto 0);
	signal s_sel, s_output : std_logic;

begin
	mux_0 : Mux
		port map(input => s_input, sel => s_sel,
		         output   => s_output);
	process
		constant patterns : pattern_array := (
			("00", '0', '0'),
			("00", '1', '0'),
			("01", '0', '1'),
			("01", '1', '0'),
			("10", '0', '0'),
			("10", '1', '1'),
			("11", '0', '1'),
			("11", '1', '1')
		);

	begin
		for i in patterns'range loop
			s_input <= patterns(i).input;
			s_sel <= patterns(i).sel;
			wait for 1 ns;
			assert s_output = patterns(i).output
			report "bad output" severity error;
		end loop;
		assert false report "end of test" severity note;
		wait;
	end process;
end behav;
