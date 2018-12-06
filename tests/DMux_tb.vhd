library ieee;
use ieee.std_logic_1164.all;
entity DMux_tb is
end DMux_tb;

library ieee;
use ieee.std_logic_1164.all;
architecture behav of DMux_tb is
	type pattern_type is record
		input, sel : std_logic;
		output : std_logic_vector(1 downto 0);
	end record;

	type pattern_array is array (natural range <>) of pattern_type;
	
	component DMux
		port(
			input  : in  std_logic;
			sel    : in  std_logic;
			output : out std_logic_vector(1 downto 0)
		);
	end component DMux;
	
	signal s_output : std_logic_vector(1 downto 0);
	signal s_sel, s_input : std_logic;

begin
	Dmux_0 : DMux
		port map(output => s_output, sel => s_sel,
		         input   => s_input);
	process
		constant patterns : pattern_array := (
			('0', '0', "00"),
			('0', '1', "00"),
			('1', '0', "01"),
			('1', '1', "10")
		);

	begin
		for i in patterns'range loop
			s_input   <= patterns(i).input;
			s_sel <= patterns(i).sel;
			wait for 1 ns;
			
			assert s_output = patterns(i).output
			report "bad output out a" severity error;
			
		end loop;
		assert false report "end of test" severity note;
		wait;
	end process;
end behav;
