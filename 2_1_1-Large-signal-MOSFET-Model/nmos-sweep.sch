v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -10 -520 790 -120 {flags=graph
y1=-0.00021179948
y2=0.00052363414
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3.637443
x2=4.3194419
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/dc_lv_nmos.raw
sim_type=dc
autoload=1
color=4
node=i(vd)}
N 10 30 10 50 {lab=GND}
N 10 80 130 80 {lab=GND}
N 130 -80 130 -30 {lab=#net1}
N 110 -80 130 -80 {lab=#net1}
N 10 -80 50 -80 {lab=#net2}
N 10 -80 10 -30 {lab=#net2}
N 10 -0 80 0 {lab=GND}
N 80 0 80 30 {lab=GND}
N -110 60 -110 80 {lab=GND}
N -110 -0 -30 0 {lab=#net3}
N 10 50 10 80 {lab=GND}
N 80 30 80 80 {lab=GND}
N 130 30 130 80 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -10 0 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} 130 0 0 0 {name=Vds value=1.8 savecurrent=false}
C {gnd.sym} 10 80 0 0 {name=l1 lab=GND}
C {ammeter.sym} 80 -80 1 0 {name=Vd savecurrent=true spice_ignore=0}
C {vsource.sym} -110 30 0 0 {name=Vgs value=0.8 savecurrent=false}
C {gnd.sym} -110 80 0 0 {name=l2 lab=GND}
C {code_shown.sym} -590 270 0 0 {name=Model only_toplevel=false value=".lib /home/jrsharp/home_mnt/asic/sky130_pdk/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt"}
C {code_shown.sym} -570 -220 0 0 {name=Spice only_toplevel=false value=".temp 27
.control
save all
save @m.XM1.msky130_fd_pr__nfet_01v8[id]
save @m.XM1.msky130_fd_pr__nfet_01v8[gm]
save @m.XM1.msky130_fd_pr__nfet_01v8[gds]
save @m.XM1.msky130_fd_pr__nfet_01v8[vth]
save @m.XM1.msky130_fd_pr__nfet_01v8[cgg]
save @m.XM1.msky130_fd_pr__nfet_01v8[cgd]
save @m.XM1.msky130_fd_pr__nfet_01v8[vdss]
save @m.XM1.msky130_fd_pr__nfet_01v8[fug]
save @m.XM1.msky130_fd_pr__nfet_01v8[rg]
save @m.XM1.msky130_fd_pr__nfet_01v8[sid]
op
write dc_lv_nmos.raw
set appendwrite
dc Vds 0 1.5 0.01 Vgs 0 1.5 0.1
write dc_lv_nmos.raw
*quit
.endc"}
C {launcher.sym} -240 -340 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dc_lv_nmos.raw dc"
}
