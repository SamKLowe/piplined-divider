@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto d902ee334f3d4161b0d73a6ce9444986 -m64 --debug typical --relax --mt 4 -L xil_defaultlib -L secureip --snapshot divide_tb_behav xil_defaultlib.divide_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
