onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /testbench/clk
add wave -noupdate -format Logic /testbench/rst
add wave -noupdate -format Logic /testbench/wdogn
add wave -noupdate -format Literal -radix hexadecimal /testbench/address
add wave -noupdate -format Literal -radix hexadecimal /testbench/data
add wave -noupdate -format Literal -radix hexadecimal /testbench/cb
add wave -noupdate -format Literal /testbench/sdcsn
add wave -noupdate -format Logic /testbench/sdwen
add wave -noupdate -format Logic /testbench/sdrasn
add wave -noupdate -format Logic /testbench/sdcasn
add wave -noupdate -format Literal /testbench/sddqm
add wave -noupdate -format Logic /testbench/sdclk
add wave -noupdate -format Literal /testbench/ramsn
add wave -noupdate -format Literal /testbench/ramoen
add wave -noupdate -format Literal /testbench/rwen
add wave -noupdate -format Literal /testbench/romsn
add wave -noupdate -format Logic /testbench/iosn
add wave -noupdate -format Logic /testbench/oen
add wave -noupdate -format Logic /testbench/read
add wave -noupdate -format Logic /testbench/writen
add wave -noupdate -format Logic /testbench/brdyn
add wave -noupdate -format Logic /testbench/bexcn
add wave -noupdate -format Logic /testbench/dsuen
add wave -noupdate -format Logic /testbench/dsutx
add wave -noupdate -format Logic /testbench/dsurx
add wave -noupdate -format Logic /testbench/dsubre
add wave -noupdate -format Logic /testbench/dsuact
add wave -noupdate -format Logic /testbench/dsurst
add wave -noupdate -format Logic /testbench/test
add wave -noupdate -format Logic /testbench/error
add wave -noupdate -format Literal /testbench/gpio
add wave -noupdate -format Logic /testbench/txd1
add wave -noupdate -format Logic /testbench/rxd1
add wave -noupdate -format Logic /testbench/spw_clk
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/core0/leon3core0/apbi
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/core0/leon3core0/apbo
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/core0/leon3core0/ahbsi
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/core0/leon3core0/ahbso
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/core0/leon3core0/ahbmi
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/core0/leon3core0/ahbmo
add wave -noupdate -format Literal -radix hexadecimal /testbench/d3/core0/leon3core0/gpt/gptimer0/r
add wave -noupdate -format Logic /testbench/d3/core0/leon3core0/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {143000 ps} 0}
configure wave -namecolwidth 201
configure wave -valuecolwidth 86
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ps} {462264 ps}
