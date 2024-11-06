onerror {exit -code 1}
vlib work
vlog -work work Instruction_memory.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Instruction_memory_vlg_vec_tst -voptargs="+acc"
vcd file -direction Instruction_memory.msim.vcd
vcd add -internal Instruction_memory_vlg_vec_tst/*
vcd add -internal Instruction_memory_vlg_vec_tst/i1/*
run -all
quit -f
