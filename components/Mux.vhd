library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux is
	port(
		input : in std_logic_vector(1 downto 0);
		sel : in std_logic;
		output : out std_logic
	);
end entity Mux;

architecture RTL of Mux is
	
begin
	output <= (input(0) and not sel) or (input(1) and sel);
end architecture RTL;
