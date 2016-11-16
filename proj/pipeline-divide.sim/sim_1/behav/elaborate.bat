@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto aa70ae2c9f48451cbb982b8604f8d94a -m64 --debug typical --relax --mt 4 -L xil_defaultlib -L secureip --snapshot divide_tb_behav xil_defaultlib.divide_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
