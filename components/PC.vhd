library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
	port(
		clk    : in  std_logic;
		rst    : in  std_logic;
		load   : in  std_logic;
		inc    : in  std_logic;
		input  : in  std_logic_vector(15 downto 0);
		output : out std_logic_vector(15 downto 0)
	);
end entity PC;

architecture RTL of PC is
	signal s_value : std_logic_vector(15 downto 0) := "0000000000000000";
	signal s_inc : std_logic_vector(15 downto 0) := "0000000000000001";
	
	component Inc16
		port(
			input  : in  std_logic_vector(15 downto 0);
			output : out std_logic_vector(15 downto 0)
		);
	end component Inc16;
	
begin
	output <= s_value;
	
	incrementer : Inc16
		port map(
			input  => s_value,
			output => s_inc
		);
	
	flipflop : process(clk) is
	begin
		if rising_edge(clk) then
			if rst = '1' then
				s_value <= "0000000000000000";
			elsif load = '1' then
				s_value <= input;
			elsif inc = '1' then
				s_value <= s_inc;	
			end if;
		end if;
	end process flipflop;

end architecture RTL;
