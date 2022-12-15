#!/bin/sh
# set -e
cd $(dirname $0)/

rm -rf plots/*
python plot_code/plot.py plots
