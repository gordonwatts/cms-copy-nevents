#!/bin/env bash

# Parse the input arguments
nEvent=10
output_name=trimmed_file.root

while getopts “:n:o:” opt; do
  case $opt in
    n )     nEvent=$OPTARG ;;
    o )     output_name=$OPTARG ;;
    : )     echo "Option $OPTARG requires an argument" 1>&2 ;;
    \? )    echo "Usage cmd [-n <nevents>] [-o <output-file-name-stem>] input-file" 1>&2
            exit
    ;;
  esac
done
shift $((OPTIND -1))

filename=$1
shift

# Ready to run it now!
echo Copy $nEvent from file $filename into $output_name
cmsRun $CMSSW_RELEASE_BASE/src/PhysicsTools/Utilities/configuration/copyPickMerge_cfg.py maxEvents=10 outputFile=/data/$output_name inputFiles=$filename
