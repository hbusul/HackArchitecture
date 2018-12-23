library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BitHolder_tb is
end entity BitHolder_tb;

architecture RTL of BitHolder_tb is
	signal clk    : std_logic;
	signal output : std_logic;
	signal load   : std_logic := '0';
	signal input  : std_logic := '1';
	signal finished : std_logic := '0';
begin
	clock_inst : entity work.ClockGenerator
		generic map(PERIOD => 20 ns)
		port map(finished => finished,
		clk => clk);

	bit_holder : entity work.BitHolder
		port map(
			clk    => clk,
			rst    => '0',
			load   => load,
			input  => input,
			output => output
		);

	process
	begin
		load  <= '0';
		input <= '1';
		wait for 21 ns;
		assert output = '0'
		report "bad output" severity error;

		load  <= '1';
		input <= '1';
		wait for 21 ns;
		assert output = '1'
		report "bad output" severity error;

		load  <= '0';
		input <= '0';
		wait for 21 ns;
		assert output = '1'
		report "bad output" severity error;

		load  <= '0';
		input <= '1';
		wait for 21 ns;
		assert output = '1'
		report "bad output" severity error;

		assert false report "end of test" severity note;
		finished <= '1';	
		wait;
	
	end process;

end architecture RTL;
