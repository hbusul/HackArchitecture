library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Inc16 is
	port(
		input : in std_logic_vector(15 downto 0);
		output : out std_logic_vector(15 downto 0)
	);
end entity Inc16;

architecture RTL of Inc16 is
	
	component Add16
		port(
			number1, number2 : in  std_logic_vector(15 downto 0);
			result           : out std_logic_vector(15 downto 0)
		);
	end component Add16;
	
begin
	mux0 : Add16
		port map(
			number1 => "0000000000000001",
			number2 => input,
			result  => output
		);
	 
end architecture RTL;
