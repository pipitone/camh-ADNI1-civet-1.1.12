
Inputs: 
 - `input_orig/` are the ADNI images with original names
 - `input/` are symlinks that have _t1.mnc appended
 - `input_1.5T/` has only 1.5T images
 - `input_3TT/` has only 3T images

Preparing the input folders using a list of the images from the standard datasets. Divide into 1.5T and 3T:
```sh  
cat 1.5T_ADNI1_standard.txt | sed 's/.mnc//g' | xargs -I{} cp -l input/{}_t1.mnc input_1.5T/
cat 3T_ADNI1_standard.txt | sed 's/.mnc//g' | xargs -I{} cp -l input/{}_t1.mnc input_3T/
```

Then create CIVET jobs using `mkjobs.sh`. This creates `ADNI1.5T.jobs` and
`ADNI3T.jobs` with appropriate CIVET settings. 

Load the necessary modules: `module load CIVET/1.1.12 Batch/pbs GNU_PARALLEL`

And GO!!!

```sh 
pbs_batch --processes=24 ADNI1.5T.jobs 24 8:00:00
pbs_batch --processes=24 ADNI3T.jobs  24 8:00:00
```
