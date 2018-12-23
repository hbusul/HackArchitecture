library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg16 is
	port(
		clk    : in  std_logic;
		rst    : in  std_logic;
		load   : in  std_logic;
		input  : in  std_logic_vector(15 downto 0);
		output : out std_logic_vector(15 downto 0)
	);
end entity Reg16;

architecture RTL of Reg16 is
	signal value : std_logic_vector(15 downto 0) := "0000000000000000";
	
begin
	output <= value;
	flipflop : process(clk, rst) is
	begin
		if rst = '1' then
			value <= "0000000000000000";
		elsif rising_edge(clk) then
			if load = '1' then
				value <= input;
			end if;
		end if;
	end process flipflop;

end architecture RTL;
