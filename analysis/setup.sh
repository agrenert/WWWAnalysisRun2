#!/bin/bash

# Setting up ROOT
export SCRAM_ARCH=slc6_amd64_gcc530   # or whatever scram_arch you need for your desired CMSSW release
export CMSSW_VERSION=CMSSW_9_2_0
source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /cvmfs/cms.cern.ch/$SCRAM_ARCH/cms/cmssw/$CMSSW_VERSION/src
eval `scramv1 runtime -sh`
cd - > /dev/null

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export LD_LIBRARY_PATH=$DIR:$LD_LIBRARY_PATH

# Copy Philip's scale factors root files
if [ ! -d ./scalefactors/ ]; then
    cp -r /home/users/phchang/public_html/analysis/www/code/WWWAnalysisRun2/analysis/scalefactors .
fi

source ./rooutil/thisrooutil.sh
