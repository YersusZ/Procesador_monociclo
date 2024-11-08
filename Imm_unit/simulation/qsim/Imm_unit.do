onerror {exit -code 1}
vlib work
vlog -work work Imm_unit.vo
vlog -work work Waveform.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Imm_unit_vlg_vec_tst -voptargs="+acc"
vcd file -direction Imm_unit.msim.vcd
vcd add -internal Imm_unit_vlg_vec_tst/*
vcd add -internal Imm_unit_vlg_vec_tst/i1/*
run -all
quit -f
