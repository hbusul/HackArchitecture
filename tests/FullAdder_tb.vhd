library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FullAdder_tb is
end entity FullAdder_tb;

architecture behav of FullAdder_tb is

	type pattern_type is record
		a, b, c, sum, carry : std_logic;
	end record;

	type pattern_array is array (natural range <>) of pattern_type;

	component FullAdder
		port(
			a, b, c    : in  std_logic;
			sum, carry : out std_logic
		);
	end component FullAdder;
	for fullAdder_0 : FullAdder use entity work.FullAdder
		port map(
			a     => a,
			b     => b,
			c     => c,
			sum   => sum,
			carry => carry
		);

	signal a, b, c, sum, carry : std_logic;

begin
	fullAdder_0 : FullAdder
		port map(
			a     => a,
			b     => b,
			c     => c,
			sum   => sum,
			carry => carry
		);

	process
		constant patterns : pattern_array := (
			('0', '0', '0', '0', '0'),
			('0', '0', '1', '1', '0'),
			('0', '1', '0', '1', '0'),
			('0', '1', '1', '0', '1'),
			('1', '0', '0', '1', '0'),
			('1', '0', '1', '0', '1'),
			('1', '1', '0', '0', '1'),
			('1', '1', '1', '1', '1')
		);
	begin
		for i in patterns'range loop
			a <= patterns(i).a;
			b <= patterns(i).b;
			c <= patterns(i).c;
			wait for 1 ns;
			assert sum = patterns(i).sum
			report "bad sum value" severity error;
			assert carry = patterns(i).carry
			report "bad carry value" severity error;
		end loop;
		assert false report "end of test" severity note;
		wait;
	end process;

end architecture behav;
