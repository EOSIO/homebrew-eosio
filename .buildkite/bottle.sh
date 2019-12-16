#!/bin/bash
set -eo pipefail

for filename in *.tar.gz; do 
    echo $filename; mv $filename ${filename/-/}
done