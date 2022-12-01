#!/usr/bin/python3

import inspect
import os
import subprocess
import time
import plac
import numpy as np
import matplotlib.pyplot as plt

def sin_x():
    x = np.linspace(0, 4*np.pi, 1000)
    sin_x = np.sin(x)
    plt.xlabel("x")
    plt.ylabel("y")
    plt.plot(x, sin_x, label="sin(x)")
    plt.ylim(-2, 2)
    plt.legend()

def plot_all(
    output_dir=os.path.abspath(os.path.join(os.path.dirname(__file__), "../../report/figures/plots/"))
):
    for function, filename in [
        (sin_x, "sin_x.svg",),
    ]:
        function()
        plt.savefig(os.path.join(output_dir, filename))
        plt.clf()

if __name__ == "__main__":
    plac.call(plot_all)
