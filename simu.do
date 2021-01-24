vlib work

vcom -93 ALU.vhd
vcom -93 ALU_tb.vhd
vcom -93 Banc_Registre.vhd
vcom -93 BancRegistre_tb.vhd
vcom -93 Unite_Traitement.vhd
vcom -93 Unite_Traitement_tb.vhd
vcom -93 Multiplexeur.vhd
vcom -93 Multiplexeur.vhd
vcom -93 Extension.vhd
vcom -93 Extension_tb.vhd
vcom -93 Memoir.vhd
vcom -93 Memoir_tb.vhd
vcom -93 AUT_modif.vhd
vcom -93 AUT_Modif_tb.vhd
vcom -93 UGI.vhd
vcom -93 UGI_tb.vhd
vcom -93 PSR.vhd
vcom -93 PSR_tb.vhd
vcom -93 Decodeur.vhd
vcom -93 Decodeur_tb.vhd
vcom -93 Monocycle.vhd
vcom -93 Monocycle_tb.vhd


vsim -novopt Monocycle_tb(test_bench)

view signals

add wave *
add wave /UUT/nPCSel
add wave /UUT/RegWr
add wave /UUT/ALUSrc
add wave /UUT/ALUCtr
add wave /UUT/PSREn

add wave /UUT/MemWr

add wave /UUT/WrSrc

add wave /UUT/RegSel

add wave -radix decimal /UUT/G2/G6/DataOut

add wave -radix decimal /UUT/G1/sPC

add wave /UUT/G4/instr_courante

add wave /UUT/G2/flag

run -all

