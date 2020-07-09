transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/patap/Documents/diseño digital/Tarea 14/ej62/parfunc.vhd}

