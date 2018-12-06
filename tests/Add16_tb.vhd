library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Add16_tb is
end entity Add16_tb;

architecture behav of Add16_tb is
	component Add16
		port(
			number1, number2 : in  std_logic_vector(15 downto 0);
			result           : out std_logic_vector(15 downto 0)
		);
	end component Add16;

	signal a, b, c : std_logic_vector(15 downto 0) := (others => '0');

begin

	adder : component Add16
		port map(
			number1 => a,
			number2 => b,
			result => c
		);

	process
	begin
		a <= "0001100000000000";
		b <= "0000000000000011";
		wait for 1 ns;
		assert c = "0001100000000011"
		report "bad sum value " severity error;
		
		a <= "1111111111111111";
		b <= "0000000000000001";
		wait for 1 ns;
		assert c = "0000000000000000"
		report "bad sum value " severity error;
		
		  
		a <= "0001111111111111";
		b <= "0000000000000001";
		wait for 1 ns;
		assert c = "0010000000000000"
		report "bad sum value " severity error;
		
		
		a <= "1111111111111111";
		b <= "0000000000000111";
		wait for 1 ns;
		assert c = "0000000000000110"
		report "bad sum value " severity error;
		
		
		assert false report "end of test" severity note;
		
		wait;
	end process;
end architecture behav;
