v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -10 -520 790 -120 {flags=graph
y1=-0.0003588862
y2=0.00037654742
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-4.8309756
x2=3.1259093
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
N 130 -80 130 -30 {lab=d}
N 110 -80 130 -80 {lab=d}
N 10 -80 50 -80 {lab=d}
N 10 -80 10 -30 {lab=d}
N 10 -0 80 0 {lab=b}
N -110 60 -110 80 {lab=GND}
N -110 -0 -30 0 {lab=g}
N 10 50 10 80 {lab=GND}
N 130 30 130 80 {lab=GND}
N 90 -0 90 20 {lab=b}
N 80 -0 90 -0 {lab=b}
N 50 -80 110 -80 {lab=d}
N 270 30 270 50 {lab=GND}
N 270 -70 270 -30 {lab=n}
C {sky130_fd_pr/nfet_01v8.sym} -10 0 0 0 {name=M1
W=\{wx\}
L=\{lx\}
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
C {vsource.sym} 130 0 0 0 {name=vd value=1.8 savecurrent=false}
C {gnd.sym} 10 80 0 0 {name=l1 lab=GND}
C {vsource.sym} -110 30 0 0 {name=vg value="0.65 AC 1" savecurrent=false}
C {gnd.sym} -110 80 0 0 {name=l2 lab=GND}
C {code_shown.sym} -590 270 0 0 {name=MODEL only_toplevel=true value=".lib /home/jrsharp/home_mnt/asic/sky130_pdk/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt

"}
C {code_shown.sym} -1110 -440 0 0 {name=Spice only_toplevel=false value=".temp 27
.option sparse
.param wx=5 lx=0.15 vbx=0
.noise v(n) vg lin 1 1 1 1
.control

option numdgt=3
set wr_singlescale
set wr_vecnames

compose l_vec  values 0.13 0.2 0.3 0.4 0.5 1 5 10
compose vg_vec start= 0 stop=1.5  step=25m
compose vd_vec start= 0 stop=1.5  step=25m
compose vb_vec values 0 0.4 0.8 1.2

foreach var1 $&l_vec
  alterparam lx=$var1
  reset
  foreach var2 $&vg_vec
    alter vg $var2
    foreach var3 $&vd_vec
      alter vd $var3
      foreach var4 $&vb_vec
        alter vsb $var4
	run 
	wrdata techsweep_sky13_lv_nmos.txt noise1.all
	destroy all
	set appendwrite
	unset set wr_vecnames
      end
    end
  end
end

set appendwrite=0

alterparam lx=0.15
alterparam vbx=0
reset
op
*showmod
show
write techsweep_sky130_lv_nmos.raw

*quit
.endc

.save b d g n
.save @m.XM1.msky130_fd_pr__nfet_01v8[id]
.save @m.XM1.msky130_fd_pr__nfet_01v8[gm]
.save @m.XM1.msky130_fd_pr__nfet_01v8[gds]
.save @m.XM1.msky130_fd_pr__nfet_01v8[vth]
.save @m.XM1.msky130_fd_pr__nfet_01v8[cgg]
.save @m.XM1.msky130_fd_pr__nfet_01v8[cgd]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[vdss]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[fug]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[rg]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[sid]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[cgsol]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[cgdol]
.save @m.XM1.msky130_fd_pr__nfet_01v8[cdd]
.save @m.XM1.msky130_fd_pr__nfet_01v8[cgb]
.save @m.XM1.msky130_fd_pr__nfet_01v8[cgd]
.save @m.XM1.msky130_fd_pr__nfet_01v8[cgg]
.save @m.XM1.msky130_fd_pr__nfet_01v8[cgs]
.save @m.XM1.msky130_fd_pr__nfet_01v8[css]
.save @m.XM1.msky130_fd_pr__nfet_01v8[gds]
.save @m.XM1.msky130_fd_pr__nfet_01v8[gm]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[gmb]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[ids]
.save @m.XM1.msky130_fd_pr__nfet_01v8[l]
.save @m.XM1.msky130_fd_pr__nfet_01v8[w]
.save @m.XM1.msky130_fd_pr__nfet_01v8[vgs]
.save @m.XM1.msky130_fd_pr__nfet_01v8[vds]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[vsb]
.save @m.XM1.msky130_fd_pr__nfet_01v8[vth]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[vdss]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[fug]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[sid]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[sfl]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[cjd]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[cjs]
*.save @m.XM1.msky130_fd_pr__nfet_01v8[rg]

"}
C {launcher.sym} -240 -340 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dc_lv_nmos.raw dc"
}
C {vsource.sym} 90 50 2 0 {name=vsb value=\{vbx\} savecurrent=false}
C {lab_wire.sym} 40 -80 0 0 {name=p1 sig_type=std_logic lab=d}
C {lab_wire.sym} -50 0 0 0 {name=p2 sig_type=std_logic lab=g}
C {lab_wire.sym} 90 0 0 0 {name=p4 sig_type=std_logic lab=b}
C {ccvs.sym} 270 0 0 0 {name=H1 vnam=vd value=1}
C {gnd.sym} 270 50 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 270 -70 0 0 {name=p3 sig_type=std_logic lab=n}
