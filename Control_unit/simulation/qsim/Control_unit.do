onerror {exit -code 1}
vlib work
vlog -work work Control_unit.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Control_unit_vlg_vec_tst -voptargs="+acc"
vcd file -direction Control_unit.msim.vcd
vcd add -internal Control_unit_vlg_vec_tst/*
vcd add -internal Control_unit_vlg_vec_tst/i1/*
run -all
quit -f
