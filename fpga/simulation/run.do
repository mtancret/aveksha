quietly set ACTELLIBNAME igloo
quietly set PROJECT_DIR "C:/Documents and Settings/Administrator/My Documents/actel/TDB_FPGA"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   vlib presynth
}
vmap presynth presynth
vmap igloo "C:/Actel/Libero_v9.0/Designer/lib/modelsim/precompiled/vlog/igloo"

vlog -work presynth "${PROJECT_DIR}/smartgen/clocks/clocks.v"
vlog -work presynth "${PROJECT_DIR}/hdl/clock_manager.v"
vlog -work presynth "${PROJECT_DIR}/hdl/io_controller.v"
vlog -work presynth "${PROJECT_DIR}/hdl/jtag_shift.v"
vlog -work presynth "${PROJECT_DIR}/hdl/jtag_pc_poll.v"
vlog -work presynth "${PROJECT_DIR}/smartgen/program_table_mem/program_table_mem.v"
vlog -work presynth "${PROJECT_DIR}/hdl/program_table_loader.v"
vlog -work presynth "${PROJECT_DIR}/hdl/function_search.v"
vlog -work presynth "${PROJECT_DIR}/hdl/mem_manager.v"
vlog -work presynth "${PROJECT_DIR}/hdl/output_buffer.v"
vlog -work presynth "${PROJECT_DIR}/hdl/jtag_controller.v"
vlog -work presynth "${PROJECT_DIR}/hdl/main.v"

vsim -L igloo -L presynth  -t 1ps presynth.main
# The following lines are commented because no testbench is associated with the project
# add wave /testbench/*
# run 1000ns
