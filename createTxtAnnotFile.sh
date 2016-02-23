#!/bin/bash

# arguments:
# $1 recordname (ex: a103l)
# $2 annotation file extension (atr)
# $3 txt annotation file (output filename containing only the samples of
#  the QRS detections in $2

rdann -r $1 -a $2 | awk '{print $2}' > $3  