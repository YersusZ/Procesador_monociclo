onerror {exit -code 1}
vlib work
vlog -work work FlipflopD.vo
vlog -work work Register_unit.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Register_unit_vlg_vec_tst -voptargs="+acc"
vcd file -direction Register_unit.msim.vcd
vcd add -internal Register_unit_vlg_vec_tst/*
vcd add -internal Register_unit_vlg_vec_tst/i1/*
run -all
quit -f
