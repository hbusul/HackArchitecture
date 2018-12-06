echo "Removing previous .cf file"
echo "rm *.cf -f";
eval "rm *.cf -f";
echo "";
echo "Running DMux testbench";

eval "ghdl -a --workdir=tests components/DMux.vhd";
eval "ghdl -a --workdir=tests tests/DMux_tb.vhd";
eval "ghdl -r --workdir=tests DMux_tb";

echo "";
echo "Running DMux4Way testbench";

eval "ghdl -a --workdir=tests components/DMux4Way.vhd";
eval "ghdl -a --workdir=tests tests/DMux4Way_tb.vhd";
eval "ghdl -r --workdir=tests DMux4Way_tb";

echo "";
echo "Running DMux8Way testbench";

eval "ghdl -a --workdir=tests components/DMux8Way.vhd";
eval "ghdl -a --workdir=tests tests/DMux8Way_tb.vhd";
eval "ghdl -r --workdir=tests DMux8Way_tb";

echo "";
echo "Running Mux testbench";

eval "ghdl -a --workdir=tests components/Mux.vhd";
eval "ghdl -a --workdir=tests tests/Mux_tb.vhd";
eval "ghdl -r --workdir=tests Mux_tb";

echo "";
echo "Running Mux16 testbench";

eval "ghdl -a --workdir=tests components/Mux16.vhd";
eval "ghdl -a --workdir=tests tests/Mux16_tb.vhd";
eval "ghdl -r --workdir=tests Mux16_tb";

echo "";
echo "Running Mux4Way16 testbench";

eval "ghdl -a --workdir=tests components/Mux4Way16.vhd";
eval "ghdl -a --workdir=tests tests/Mux4Way16_tb.vhd";
eval "ghdl -r --workdir=tests Mux4Way16_tb";

echo "";
echo "Running Mux8Way16 testbench";

eval "ghdl -a --workdir=tests components/Mux8Way16.vhd";
eval "ghdl -a --workdir=tests tests/Mux8Way16_tb.vhd";
eval "ghdl -r --workdir=tests Mux8Way16_tb";

echo "";
echo "Running HalfAdder testbench";

eval "ghdl -a --workdir=tests components/HalfAdder.vhd";
eval "ghdl -a --workdir=tests tests/HalfAdder_tb.vhd";
eval "ghdl -r --workdir=tests HalfAdder_tb";

echo "";
echo "Running Fulldder testbench";

eval "ghdl -a --workdir=tests components/FullAdder.vhd";
eval "ghdl -a --workdir=tests tests/FullAdder_tb.vhd";
eval "ghdl -r --workdir=tests FullAdder_tb";

echo "";
echo "Running Add16 testbench";

eval "ghdl -a --workdir=tests components/Add16.vhd";
eval "ghdl -a --workdir=tests tests/Add16_tb.vhd";
eval "ghdl -r --workdir=tests Add16_tb";

echo "";
echo "Running Inc16 testbench";

eval "ghdl -a --workdir=tests components/Inc16.vhd";
eval "ghdl -a --workdir=tests tests/Inc16_tb.vhd";
eval "ghdl -r --workdir=tests Inc16_tb";

echo "";
echo "Running Equ16 testbench";

eval "ghdl -a --workdir=tests components/Equ16.vhd";
eval "ghdl -a --workdir=tests tests/Equ16_tb.vhd";
eval "ghdl -r --workdir=tests Equ16_tb";