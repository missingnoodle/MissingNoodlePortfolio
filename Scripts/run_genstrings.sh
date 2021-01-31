#!/bin/sh

#  run_genstrings.sh
#  MissingNoodlePortfolio
#
#  Created by Tami Black on 1/31/21.
#
# Note flag -SwiftUI is needed for SwiftUI projects.

cd ../
genstrings -SwiftUI *.swift
