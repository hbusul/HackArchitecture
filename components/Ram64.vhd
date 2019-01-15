library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Ram64 is
	port(
		clk    : in  std_logic;
		rst    : in  std_logic;
		load   : in  std_logic;
		address : in std_logic_vector(5 downto 0);
		input  : in  std_logic_vector(15 downto 0);
		output : out std_logic_vector(15 downto 0)
	);
end entity Ram64;

architecture RTL of Ram64 is
	type REGISTER_VALUES is array (7 downto 0) of std_logic_vector(15 downto 0);
	
	component Ram8
		port(
			clk     : in  std_logic;
			rst     : in  std_logic;
			load    : in  std_logic;
			address : in  std_logic_vector(2 downto 0);
			input   : in  std_logic_vector(15 downto 0);
			output  : out std_logic_vector(15 downto 0)
		);
	end component Ram8;
	
	
	signal s_reg_values : REGISTER_VALUES := (
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000"
	);
	
	signal s_load_values : std_logic_vector(7 downto 0) := "00000000";
	
begin
	tie_components : for i in 0 to 7 generate
		comp : Ram8
			port map(
				clk     => clk,
				rst     => rst,
				load    => s_load_values(i),
				address => address(2 downto 0),
				input   => input,
				output  => s_reg_values(i)
			);
	end generate tie_components;
	
	dmux : entity work.DMux8Way
		port map(
			sel    => address(5 downto 3),
			input  => load,
			output => s_load_values
		);
			
			
	process(clk) is
	begin
		if rising_edge(clk) then
			if address(5 downto 3) = "000" then 
				output <= s_reg_values(0);
			elsif address(5 downto 3) = "001" then
				output <= s_reg_values(1);
			elsif address(5 downto 3) = "010" then 
				output <= s_reg_values(2);
			elsif address(5 downto 3) = "011" then
				output <= s_reg_values(3);
			elsif address(5 downto 3) = "100" then
				output <= s_reg_values(4);
			elsif address(5 downto 3) = "101" then
				output <= s_reg_values(5);
			elsif address(5 downto 3) = "110" then
				output <= s_reg_values(6);	
			elsif address(5 downto 3) = "111" then
				output <= s_reg_values(7);		
			end if;
		end if;
	end process;

end architecture RTL;
