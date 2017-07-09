GHDL=ghdl
WAVE=gtkwave

all: run

compile: stp.vhdl stp_tb.vhdl
	${GHDL} -a stp.vhdl stp_tb.vhdl

simulate: compile
	${GHDL} -e audiostp_tb

run: simulate
	${GHDL} -r audiostp_tb --vcd=stp.vcd

clean: 
	rm stp.vcd work-obj93.cf

