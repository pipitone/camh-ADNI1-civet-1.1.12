#!/bin/bash
for i in input_1.5T/*; do 
    wo_prefix=${i/input_1.5T\/ADNI_/};
    imageid=${wo_prefix/_t1.mnc/};

    echo \
    CIVET_Processing_Pipeline  \
        -spawn  \
        -model ADNInl  \
        -sourcedir input_1.5T/ \
        -targetdir output_1.5T/ \
        -lsq12 \
        -N3-distance 200 \
        -resample-surfaces \
        -thickness tlink 20 \
        -no-VBM \
        -prefix ADNI \
        -run \
         $imageid 
done > ADNI1.5T.jobs

for i in input_3T/*; do 
    wo_prefix=${i/input_3T\/ADNI_/};
    imageid=${wo_prefix/_t1.mnc/};

    echo \
    CIVET_Processing_Pipeline  \
        -spawn  \
        -model ADNInl  \
        -sourcedir input_3T/ \
        -targetdir output_3T/ \
        -3Tesla \
        -lsq12 \
        -N3-distance 50 \
        -resample-surfaces \
        -thickness tlink 20 \
        -no-VBM \
        -prefix ADNI \
        -run \
         $imageid 
done > ADNI3T.jobs
