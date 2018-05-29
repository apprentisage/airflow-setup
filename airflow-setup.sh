#!/bin/bash
chmod +x *.sh
./conda.sh
conda env create -f spd.yml
./condaremote.sh