
import numpy as np
from matplotlib import pyplot as plt

from load_spice import load_spice

def load_params(file):

    plots = load_spice.load_spice("build/{}".format(file))

    params = file.split(".raw")[0].split("_")
    
    corner = params[0]
    length = params[1]
    width  = params[2]

    print("Results for corner = {}, L = {} um, W = {} um".format(corner, length, width))

    plot1 = plots[1]
    print(plot1['vars'])
#    print(plot1['data'])

    # Plot Id as a function of Vds for each Vgs
    Id = plot1['data']['i(vd)']
    Vds = plot1['data']['v(net_ds)']
    Vgs = plot1['data']['v(net_gs)']

    arr = np.array(Vgs)
    diff = np.diff(Vgs) != 0
    chunk_boundaries = np.insert(diff, 0, True)
    chunks = np.split(arr, np.where(chunk_boundaries)[0])

    print(len(chunks[1]))

    i = 0
    for c in chunks[1::]:
        plt.plot(Vds[i:i+len(c)], Id[i:i+len(c)], label="Vgs = {:1.2f}".format(c[0]))
        i = i + len(c)

    plt.title('Id vs. Vds for values of Vgs for nmos corner = {}, length = {}, width = {}'.format(corner, length, width))

    # Add x and y axis labels
    plt.xlabel('Vds, Volts')
    plt.ylabel('Id, A')

    plt.legend()

    #plt.show()
    plt.savefig('results/{}_{}_{}_Id_vs_Vds.png'.format(corner, length, width), format='png')
    plt.clf()

    gm = plot1['data']['@m.xm1.msky130_fd_pr__nfet_01v8[gm]']

    # Plot gm as a function of Vds, Vgs

    i = 0
    for c in chunks[1::]:
        plt.plot(Vds[i:i+len(c)], gm[i:i+len(c)], label="Vgs = {:1.2f}".format(c[0]))
        i = i + len(c)

    plt.title('gm vs. Vds for values of Vgs for nmos corner = {}, length = {}, width = {}'.format(corner, length, width))

    # Add x and y axis labels
    plt.xlabel('Vds, Volts')
    plt.ylabel('gm, S')

    plt.legend()
    #plt.show()

    plt.savefig('results/{}_{}_{}_Gm_vs_Vds.png'.format(corner, length, width), format='png')
    plt.clf()

    # Plot gm / Id as a function of Vgs

    gm_on_ids = []
    Vgs_arr = []

    i = 0
    for c in chunks[1::]:
        gm_on_Id = gm[i:i+len(c)] / Id[i:i+len(c)]
        gm_on_ids.append(gm_on_Id[len(gm_on_Id) // 2])
        Vgs_arr.append(c[0])
        i = i + len(c)

    plt.plot(Vgs_arr, gm_on_ids)
    plt.title('gm/Id vs. Vgs for nmos corner = {}, length = {}, width = {}'.format(corner, length, width))

    # Add x and y axis labels
    plt.xlabel('Vgs, Volts')
    plt.ylabel('gm/Id, S/A')

    plt.legend()
    #plt.show()
    plt.savefig('results/{}_{}_{}_gm_on_Id_vs_Vgs.png'.format(corner, length, width), format='png')
    plt.clf()
    
    # Plot cgg as a function of Vds and Vgs

    cgg = plot1['data']['@m.xm1.msky130_fd_pr__nfet_01v8[cgg]']

    i = 0
    for c in chunks[1::]:
        plt.plot(Vds[i:i+len(c)], cgg[i:i+len(c)], label="Vgs = {:1.2f}".format(c[0]))
        i = i + len(c)

    plt.title('Cgg vs. Vds for values of Vgs for nmos corner = {}, length = {}, width = {}'.format(corner, length, width))

    # Add x and y axis labels
    plt.xlabel('Vds, Volts')
    plt.ylabel('Cgg, F')

    plt.legend()
    #plt.show()

    plt.savefig('results/{}_{}_{}_Cgg_vs_Vds.png'.format(corner, length, width), format='png')
    plt.clf()


# List all raw files in the build directory. The format is "corner_length_width.raw"

import os

# Specify the directory
directory = 'build'

# List all files that end with .raw
raw_files = [f for f in os.listdir(directory) if f.endswith('.raw')]

raw_files = sorted(raw_files)

for f in raw_files:
    load_params(f)
