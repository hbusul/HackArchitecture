library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DMux8Way is
	port(
		sel : in std_logic_vector(2 downto 0);
		input : in std_logic;
		output : out std_logic_vector(7 downto 0)
	);
end entity DMux8Way;


architecture RTL of DMux8Way is
	component DMux4Way
		port(
			sel    : in  std_logic_vector(1 downto 0);
			input  : in  std_logic;
			output : out std_logic_vector(3 downto 0)
		);
	end component DMux4Way;
	
	component DMux
		port(
			input  : in  std_logic;
			sel    : in  std_logic;
			output : out std_logic_vector(1 downto 0)
		);
	end component DMux;
	
	signal intermediate : std_logic_vector(1 downto 0);
	
begin
	mux0 : DMux
		port map(
			input  => input,
			sel    => sel(2),
			output => intermediate
		);

	mux1 : DMux4Way
		port map(
			sel    => sel(1 downto 0),
			input  => intermediate(0),
			output => output(3 downto 0)
		);
		
	mux2: DMux4Way
		port map(
			sel    => sel(1 downto 0),
			input  => intermediate(1),
			output => output(7 downto 4)
		);




end architecture RTL;
