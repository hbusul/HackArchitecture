library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HalfAdder_tb is
end entity HalfAdder_tb;

architecture behav of HalfAdder_tb is
	type pattern_type is record
		a, b, sum, carry : std_logic;
	end record;

	type pattern_array is array (natural range <>) of pattern_type;

	component HalfAdder
		port(a, b : in std_logic; sum, carry : out std_logic);
	end component;

	for halfAdder_0 : HalfAdder use entity work.HalfAdder
		port map(
			a     => a,
			b     => b,
			sum   => sum,
			carry => carry
		);


	signal a, b, sum, carry : std_logic;

begin
	halfAdder_0 : HalfAdder
		port map(a     => a, b => b, sum => sum,
		         carry => carry);

	process
	constant patterns : pattern_array := (
		('0', '0', '0', '0'),
		('0', '1', '1', '0'),
		('1', '0', '1', '0'),
		('1', '1', '0', '1')
	);
	
	begin
		for i in patterns'range loop
			a   <= patterns(i).a;
			b   <= patterns(i).b;
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
