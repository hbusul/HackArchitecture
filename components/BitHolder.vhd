library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BitHolder is
	port(
		clk    : in  std_logic;
		rst    : in  std_logic;
		load   : in  std_logic;
		input  : in  std_logic;
		output : out std_logic
	);
end entity BitHolder;

architecture RTL of BitHolder is
	signal bit : std_logic := '0';
	
begin
	output <= bit;
	flipflop : process(clk, rst) is
	begin
		if rst = '1' then
			bit <= '0';
		elsif rising_edge(clk) then
			if load = '1' then
				bit <= input;
			end if;
		end if;
	end process flipflop;
	
	
	

end architecture RTL;
