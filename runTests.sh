echo "Removing previous .cf file"
echo "rm *.cf -f";
eval "rm *.cf -f";
echo "";

eval "ghdl -a --workdir=tests components/ClockGenerator.vhd";
components=("DMux" "DMux4Way" "DMux8Way" "Mux" "Mux16" "Mux4Way16" "Mux8Way16" "HalfAdder" "FullAdder" "Add16" "Inc16" "Equ16" "ALU" "BitHolder" "Reg16" "PC")


for i in "${components[@]}"; do
	echo "";
	echo "Running $i testbench";
	eval "ghdl -a --workdir=tests components/${i}.vhd";
	eval "ghdl -a --workdir=tests tests/${i}_tb.vhd";
	eval "ghdl -r --workdir=tests ${i}_tb";
done