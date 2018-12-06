library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Add16 is
	port(
		number1, number2 : in  std_logic_vector(15 downto 0);
		result           : out std_logic_vector(15 downto 0)
	);
end entity Add16;

architecture behavioral of Add16 is
	component FullAdder
		port(
			a, b, c    : in  std_logic;
			sum, carry : out std_logic
		);
	end component FullAdder;

	signal carries : std_logic_vector(15 downto 0);
begin
	fullAdder0 : component FullAdder
		port map(
			a     => number1(0),
			b     => number2(0),
			c     => '0',
			sum   => result(0),
			carry => carries(0)
		);

	fullAdder1 : component FullAdder
		port map(
			a     => number1(1),
			b     => number2(1),
			c     => carries(0),
			sum   => result(1),
			carry => carries(1)
		);
		
	fullAdder2 : component FullAdder
		port map(
			a     => number1(2),
			b     => number2(2),
			c     => carries(1),
			sum   => result(2),
			carry => carries(2)
		);	
		
	fullAdder3 : component FullAdder
		port map(
			a     => number1(3),
			b     => number2(3),
			c     => carries(2),
			sum   => result(3),
			carry => carries(3)
		);	

	fullAdder4 : component FullAdder
		port map(
			a     => number1(4),
			b     => number2(4),
			c     => carries(3),
			sum   => result(4),
			carry => carries(4)
		);
		
	fullAdder5 : component FullAdder
		port map(
			a     => number1(5),
			b     => number2(5),
			c     => carries(4),
			sum   => result(5),
			carry => carries(5)
		);	
		
	fullAdder6 : component FullAdder
		port map(
			a     => number1(6),
			b     => number2(6),
			c     => carries(5),
			sum   => result(6),
			carry => carries(6)
		);	
		
		
	fullAdder7 : component FullAdder
		port map(
			a     => number1(7),
			b     => number2(7),
			c     => carries(6),
			sum   => result(7),
			carry => carries(7)
		);	
		
	fullAdder8 : component FullAdder
		port map(
			a     => number1(8),
			b     => number2(8),
			c     => carries(7),
			sum   => result(8),
			carry => carries(8)
		);			
		
		
	fullAdder9 : component FullAdder
		port map(
			a     => number1(9),
			b     => number2(9),
			c     => carries(8),
			sum   => result(9),
			carry => carries(9)
		);	
		
		
	fullAdder10 : component FullAdder
		port map(
			a     => number1(10),
			b     => number2(10),
			c     => carries(9),
			sum   => result(10),
			carry => carries(10)
		);	
		
	fullAdder11 : component FullAdder
		port map(
			a     => number1(11),
			b     => number2(11),
			c     => carries(10),
			sum   => result(11),
			carry => carries(11)
		);	
		
		
	fullAdder12 : component FullAdder
		port map(
			a     => number1(12),
			b     => number2(12),
			c     => carries(11),
			sum   => result(12),
			carry => carries(12)
		);					
		
	fullAdder13 : component FullAdder
		port map(
			a     => number1(13),
			b     => number2(13),
			c     => carries(12),
			sum   => result(13),
			carry => carries(13)
		);	
		
	fullAdder14 : component FullAdder
		port map(
			a     => number1(14),
			b     => number2(14),
			c     => carries(13),
			sum   => result(14),
			carry => carries(14)
		);	
		
	fullAdder15 : component FullAdder
		port map(
			a     => number1(15),
			b     => number2(15),
			c     => carries(14),
			sum   => result(15),
			carry => carries(15)
		);	
		
end architecture Behavioral;
