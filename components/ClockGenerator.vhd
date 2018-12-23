library IEEE;
use IEEE.std_logic_1164.all;

-- Generate a clock signal. 
-- Duty cycle is 50%. 
-- Frequency = 1/(2*PERIOD)

entity ClockGenerator is
	generic(
		PERIOD : time := 25 ns
	);
	port(
		finished : in std_logic;
		clk : out std_logic
	);
end entity ClockGenerator;

architecture behav of ClockGenerator is
begin
	CLOCK_DRIVER : process is
	begin
		if finished = '0' then
			clk <= '0';
			wait for PERIOD / 2;
			clk <= '1';
			wait for PERIOD / 2;
		else	
			wait; --this ends the testbench
		end if;
	end process CLOCK_DRIVER;

end architecture behav;
