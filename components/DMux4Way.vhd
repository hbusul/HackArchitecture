library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DMux4Way is
	port(
		sel : in std_logic_vector(1 downto 0);
		input : in std_logic;
		output : out std_logic_vector(3 downto 0)
	);
end entity DMux4Way;


architecture RTL of DMux4Way is
	
	component DMux
		port(
			input  : in  std_logic;
			sel    : in  std_logic;
			output : out std_logic_vector(1 downto 0)
		);
	end component DMux;
	
	signal sigA : std_logic;
	signal sigB : std_logic;
	
begin
	dmux0 : DMux
		port map(
			input => input,
			sel   => sel(1),
			output(0)  => sigA,
			output(1)  => sigB
		);

	dmux1 : DMux
		port map(
			input => sigA,
			sel   => sel(0),
			output(0)  => output(0),
			output(1)  => output(1)
		);	
		
	dmux2 : DMux
		port map(
			input => sigB,
			sel   => sel(0),
			output(0)  => output(2),
			output(1)  => output(3)
		);	

end architecture RTL;
