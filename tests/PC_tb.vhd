library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC_tb is
end entity PC_tb;

architecture RTL of PC_tb is
	signal s_clk    : std_logic;
	signal s_output : std_logic_vector(15 downto 0);
	signal s_load   : std_logic := '0';
	signal s_inc 	: std_logic := '0';
	signal s_input  : std_logic_vector(15 downto 0);
	signal s_finished : std_logic := '0';
begin
	clock_inst : entity work.ClockGenerator
		generic map(PERIOD => 20 ns)
		port map(finished => s_finished,
		clk => s_clk);

	pc : entity work.PC
		port map(
			clk    => s_clk,
			rst    => '0',
			load   => s_load,
			inc    => s_inc,
			input  => s_input,
			output => s_output
		);	

	process
	begin
		s_load  <= '0';
		s_input <= "1001110100001000";
		wait for 20 ns;
		assert s_output = "0000000000000000"
		report "bad output" severity error;

		s_load  <= '1';
		s_input <= "1111111111111111";
		wait for 20 ns;
		assert s_output = "1111111111111111"
		report "bad output" severity error;
		
		s_load <= '0';
		s_input <= "0101001111000100";
		s_inc <= '1';
		wait for 20 ns;
		assert s_output = "0000000000000000" 
		report "bad output" severity error;
		 
		s_load <= '0';
		s_input <= "0101001111000100";
		s_inc <= '1';
		wait for 20 ns;
		assert s_output = "0000000000000001" 
		report "bad output" severity error; 

		s_load  <= '1';
		s_input <= "1001110111001000";
		wait for 20 ns;
		assert s_output = "1001110111001000"
		report "bad output" severity error;

		s_load  <= '0';
		s_inc <= '0';
		s_input <= "1001110111111000";
		wait for 20 ns;
		assert s_output = "1001110111001000"
		report "bad output" severity error;

		assert false report "end of test" severity note;
		s_finished <= '1';	
		wait;
	
	end process;

end architecture RTL;
