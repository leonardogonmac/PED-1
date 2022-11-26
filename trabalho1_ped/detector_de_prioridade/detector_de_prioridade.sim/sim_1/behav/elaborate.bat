@echo off
set xv_path=D:\\Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto b6d2bec4fa584a0b884847b807c76e47 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot detector_prioridade_behav xil_defaultlib.detector_prioridade -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
