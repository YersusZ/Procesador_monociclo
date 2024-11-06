onerror {exit -code 1}
vlib work
vlog -work work Data_memory.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Data_memory_vlg_vec_tst -voptargs="+acc"
vcd file -direction Data_memory.msim.vcd
vcd add -internal Data_memory_vlg_vec_tst/*
vcd add -internal Data_memory_vlg_vec_tst/i1/*
run -all
quit -f
