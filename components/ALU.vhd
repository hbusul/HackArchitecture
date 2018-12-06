library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port(
		x : in std_logic_vector(15 downto 0);
		y : in std_logic_vector(15 downto 0);
		zx, nx, zy, ny, f, no : in std_logic;
		output : out std_logic_vector(15 downto 0);
		zr : out std_logic;
		ng : out std_logic	
	);
end entity ALU;

architecture RTL of ALU is
	
	component Mux16
		port(
			input0 : in  std_logic_vector(15 downto 0);
			input1 : in  std_logic_vector(15 downto 0);
			sel    : in  std_logic;
			output : out std_logic_vector(15 downto 0)
		);
	end component Mux16;
	
	component Add16
		port(
			number1, number2 : in  std_logic_vector(15 downto 0);
			result           : out std_logic_vector(15 downto 0)
		);
	end component Add16;
	
	component Equ16
		port(
			value0, value1 : in  std_logic_vector(15 downto 0);
			equal          : out std_logic
		);
	end component Equ16;
	
	
	signal s_x_state1, s_x_state2 : std_logic_vector(15 downto 0);
	signal s_y_state1, s_y_state2 : std_logic_vector(15 downto 0);
	signal s_x_plus_y , s_x_and_y : std_logic_vector(15 downto 0);
	signal s_function_out : std_logic_vector(15 downto 0);
	signal s_out : std_logic_vector(15 downto 0);
begin
	
	output <= s_out;
	ng <= s_out(15);
	
	isZero : component Equ16
		port map(
			value0 => s_out,
			value1 => "0000000000000000",
			equal  => zr
		);
	
	
	xSetZero : Mux16
		port map(
			input0 => x,
			input1 => "0000000000000000",
			sel    => zx,
			output => s_x_state1
		);
		
	negateX: Mux16
		port map(
			input0 => s_x_state1,
			input1 => not s_x_state1,
			sel    => nx,
			output => s_x_state2
		);	
		
	ySetZero : Mux16
		port map(
			input0 => y,
			input1 => "0000000000000000",
			sel    => zy,
			output => s_y_state1
		);	
		
	negateY: Mux16
		port map(
			input0 => s_y_state1,
			input1 => not s_y_state1,
			sel    => ny,
			output => s_y_state2
		);	
		
		
	sumUp : Add16
		port map(
			number1 => s_y_state2,
			number2 => s_x_state2,
			result  => s_x_plus_y
		);	
		
	s_x_and_y <= s_x_state2 and s_y_state2;	
	
	funct : Mux16
		port map(
			input0 => s_x_and_y,
			input1 => s_x_plus_y,
			sel    => f,
			output => s_function_out
		);
	
	negateOut : Mux16
		port map(
			input0 => s_function_out,
			input1 => not s_function_out,
			sel    => no,
			output => s_out
		);
		
	
end architecture RTL;
