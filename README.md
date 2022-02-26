# snakemake_split
An example of splitting up Snakemake input into chunks using CheckM as an example

- only tested on Linux, will probably only work on linux/unix systems

Here is what it does:

- looks for .fa files in folder mags
- creates a new folder mag_split
- creates sub-directories split_0 ... split_N
- creates sym-links in those sub-directories to the orginal .fa files
- number of sym-links in each split dir depends on parameter to function

NOTE this will happen whenever you run Snakemake, even if -np, even if --unlock, it will happen

Once the .fa MAGs have been "split", it will run CheckM on each "split"

Here is what happens if you run ```snakemake -np```

```sh
$ snakemake -np
Successfully created the directory mag_split
Successfully created the directory mag_split/split_0
snakemake_split/mags/UBA1050_genomic.fa -> snakemake_split/mag_split/split_0/UBA1050_genomic.fa
snakemake_split/mags/UBA1020_genomic.fa -> snakemake_split/mag_split/split_0/UBA1020_genomic.fa
snakemake_split/mags/UBA1031_genomic.fa -> snakemake_split/mag_split/split_0/UBA1031_genomic.fa
snakemake_split/mags/UBA1030_genomic.fa -> snakemake_split/mag_split/split_0/UBA1030_genomic.fa
snakemake_split/mags/UBA1025_genomic.fa -> snakemake_split/mag_split/split_0/UBA1025_genomic.fa
snakemake_split/mags/UBA1034_genomic.fa -> snakemake_split/mag_split/split_0/UBA1034_genomic.fa
snakemake_split/mags/UBA1024_genomic.fa -> snakemake_split/mag_split/split_0/UBA1024_genomic.fa
snakemake_split/mags/UBA1037_genomic.fa -> snakemake_split/mag_split/split_0/UBA1037_genomic.fa
snakemake_split/mags/UBA1085_genomic.fa -> snakemake_split/mag_split/split_0/UBA1085_genomic.fa
Successfully created the directory mag_split/split_1
snakemake_split/mags/UBA1081_genomic.fa -> snakemake_split/mag_split/split_1/UBA1081_genomic.fa
snakemake_split/mags/UBA1000_genomic.fa -> snakemake_split/mag_split/split_1/UBA1000_genomic.fa
snakemake_split/mags/UBA1003_genomic.fa -> snakemake_split/mag_split/split_1/UBA1003_genomic.fa
snakemake_split/mags/UBA1083_genomic.fa -> snakemake_split/mag_split/split_1/UBA1083_genomic.fa
snakemake_split/mags/UBA1065_genomic.fa -> snakemake_split/mag_split/split_1/UBA1065_genomic.fa
snakemake_split/mags/UBA1013_genomic.fa -> snakemake_split/mag_split/split_1/UBA1013_genomic.fa
snakemake_split/mags/UBA1053_genomic.fa -> snakemake_split/mag_split/split_1/UBA1053_genomic.fa
snakemake_split/mags/UBA1042_genomic.fa -> snakemake_split/mag_split/split_1/UBA1042_genomic.fa
snakemake_split/mags/UBA1054_genomic.fa -> snakemake_split/mag_split/split_1/UBA1054_genomic.fa
snakemake_split/mags/UBA1080_genomic.fa -> snakemake_split/mag_split/split_1/UBA1080_genomic.fa
Successfully created the directory mag_split/split_2
snakemake_split/mags/UBA1086_genomic.fa -> snakemake_split/mag_split/split_2/UBA1086_genomic.fa
snakemake_split/mags/UBA1082_genomic.fa -> snakemake_split/mag_split/split_2/UBA1082_genomic.fa
snakemake_split/mags/UBA1044_genomic.fa -> snakemake_split/mag_split/split_2/UBA1044_genomic.fa
snakemake_split/mags/UBA1074_genomic.fa -> snakemake_split/mag_split/split_2/UBA1074_genomic.fa
snakemake_split/mags/UBA1026_genomic.fa -> snakemake_split/mag_split/split_2/UBA1026_genomic.fa
snakemake_split/mags/UBA1010_genomic.fa -> snakemake_split/mag_split/split_2/UBA1010_genomic.fa
snakemake_split/mags/UBA1070_genomic.fa -> snakemake_split/mag_split/split_2/UBA1070_genomic.fa
snakemake_split/mags/UBA1023_genomic.fa -> snakemake_split/mag_split/split_2/UBA1023_genomic.fa
snakemake_split/mags/UBA1057_genomic.fa -> snakemake_split/mag_split/split_2/UBA1057_genomic.fa
snakemake_split/mags/UBA1036_genomic.fa -> snakemake_split/mag_split/split_2/UBA1036_genomic.fa
Successfully created the directory mag_split/split_3
snakemake_split/mags/UBA1004_genomic.fa -> snakemake_split/mag_split/split_3/UBA1004_genomic.fa
snakemake_split/mags/UBA1089_genomic.fa -> snakemake_split/mag_split/split_3/UBA1089_genomic.fa
snakemake_split/mags/UBA1022_genomic.fa -> snakemake_split/mag_split/split_3/UBA1022_genomic.fa
snakemake_split/mags/UBA1032_genomic.fa -> snakemake_split/mag_split/split_3/UBA1032_genomic.fa
snakemake_split/mags/UBA1048_genomic.fa -> snakemake_split/mag_split/split_3/UBA1048_genomic.fa
snakemake_split/mags/UBA1012_genomic.fa -> snakemake_split/mag_split/split_3/UBA1012_genomic.fa
snakemake_split/mags/UBA1063_genomic.fa -> snakemake_split/mag_split/split_3/UBA1063_genomic.fa
snakemake_split/mags/UBA1027_genomic.fa -> snakemake_split/mag_split/split_3/UBA1027_genomic.fa
snakemake_split/mags/UBA1079_genomic.fa -> snakemake_split/mag_split/split_3/UBA1079_genomic.fa
snakemake_split/mags/UBA1072_genomic.fa -> snakemake_split/mag_split/split_3/UBA1072_genomic.fa
Successfully created the directory mag_split/split_4
snakemake_split/mags/UBA1084_genomic.fa -> snakemake_split/mag_split/split_4/UBA1084_genomic.fa
snakemake_split/mags/UBA1045_genomic.fa -> snakemake_split/mag_split/split_4/UBA1045_genomic.fa
snakemake_split/mags/UBA1066_genomic.fa -> snakemake_split/mag_split/split_4/UBA1066_genomic.fa
snakemake_split/mags/UBA1055_genomic.fa -> snakemake_split/mag_split/split_4/UBA1055_genomic.fa
snakemake_split/mags/UBA1017_genomic.fa -> snakemake_split/mag_split/split_4/UBA1017_genomic.fa
snakemake_split/mags/UBA1046_genomic.fa -> snakemake_split/mag_split/split_4/UBA1046_genomic.fa
snakemake_split/mags/UBA1049_genomic.fa -> snakemake_split/mag_split/split_4/UBA1049_genomic.fa
snakemake_split/mags/UBA1052_genomic.fa -> snakemake_split/mag_split/split_4/UBA1052_genomic.fa
snakemake_split/mags/UBA1016_genomic.fa -> snakemake_split/mag_split/split_4/UBA1016_genomic.fa
snakemake_split/mags/UBA1005_genomic.fa -> snakemake_split/mag_split/split_4/UBA1005_genomic.fa
Successfully created the directory mag_split/split_5
snakemake_split/mags/UBA1018_genomic.fa -> snakemake_split/mag_split/split_5/UBA1018_genomic.fa
snakemake_split/mags/UBA1077_genomic.fa -> snakemake_split/mag_split/split_5/UBA1077_genomic.fa
snakemake_split/mags/UBA1061_genomic.fa -> snakemake_split/mag_split/split_5/UBA1061_genomic.fa
snakemake_split/mags/UBA1040_genomic.fa -> snakemake_split/mag_split/split_5/UBA1040_genomic.fa
snakemake_split/mags/UBA1090_genomic.fa -> snakemake_split/mag_split/split_5/UBA1090_genomic.fa
snakemake_split/mags/UBA1028_genomic.fa -> snakemake_split/mag_split/split_5/UBA1028_genomic.fa
snakemake_split/mags/UBA1059_genomic.fa -> snakemake_split/mag_split/split_5/UBA1059_genomic.fa
snakemake_split/mags/UBA1015_genomic.fa -> snakemake_split/mag_split/split_5/UBA1015_genomic.fa
snakemake_split/mags/UBA1073_genomic.fa -> snakemake_split/mag_split/split_5/UBA1073_genomic.fa
snakemake_split/mags/UBA1035_genomic.fa -> snakemake_split/mag_split/split_5/UBA1035_genomic.fa
Successfully created the directory mag_split/split_6
snakemake_split/mags/UBA1033_genomic.fa -> snakemake_split/mag_split/split_6/UBA1033_genomic.fa
snakemake_split/mags/UBA1071_genomic.fa -> snakemake_split/mag_split/split_6/UBA1071_genomic.fa
snakemake_split/mags/UBA1068_genomic.fa -> snakemake_split/mag_split/split_6/UBA1068_genomic.fa
snakemake_split/mags/UBA1011_genomic.fa -> snakemake_split/mag_split/split_6/UBA1011_genomic.fa
snakemake_split/mags/UBA1067_genomic.fa -> snakemake_split/mag_split/split_6/UBA1067_genomic.fa
snakemake_split/mags/UBA1019_genomic.fa -> snakemake_split/mag_split/split_6/UBA1019_genomic.fa
snakemake_split/mags/UBA1069_genomic.fa -> snakemake_split/mag_split/split_6/UBA1069_genomic.fa
snakemake_split/mags/UBA1014_genomic.fa -> snakemake_split/mag_split/split_6/UBA1014_genomic.fa
snakemake_split/mags/UBA1029_genomic.fa -> snakemake_split/mag_split/split_6/UBA1029_genomic.fa
snakemake_split/mags/UBA1041_genomic.fa -> snakemake_split/mag_split/split_6/UBA1041_genomic.fa
Successfully created the directory mag_split/split_7
snakemake_split/mags/UBA1047_genomic.fa -> snakemake_split/mag_split/split_7/UBA1047_genomic.fa
snakemake_split/mags/UBA1091_genomic.fa -> snakemake_split/mag_split/split_7/UBA1091_genomic.fa
snakemake_split/mags/UBA1043_genomic.fa -> snakemake_split/mag_split/split_7/UBA1043_genomic.fa
snakemake_split/mags/UBA1009_genomic.fa -> snakemake_split/mag_split/split_7/UBA1009_genomic.fa
snakemake_split/mags/UBA1021_genomic.fa -> snakemake_split/mag_split/split_7/UBA1021_genomic.fa
snakemake_split/mags/UBA1001_genomic.fa -> snakemake_split/mag_split/split_7/UBA1001_genomic.fa
snakemake_split/mags/UBA1051_genomic.fa -> snakemake_split/mag_split/split_7/UBA1051_genomic.fa
snakemake_split/mags/UBA1093_genomic.fa -> snakemake_split/mag_split/split_7/UBA1093_genomic.fa
snakemake_split/mags/UBA1075_genomic.fa -> snakemake_split/mag_split/split_7/UBA1075_genomic.fa
snakemake_split/mags/UBA1038_genomic.fa -> snakemake_split/mag_split/split_7/UBA1038_genomic.fa
Successfully created the directory mag_split/split_8
snakemake_split/mags/UBA1088_genomic.fa -> snakemake_split/mag_split/split_8/UBA1088_genomic.fa
snakemake_split/mags/UBA1078_genomic.fa -> snakemake_split/mag_split/split_8/UBA1078_genomic.fa
snakemake_split/mags/UBA1062_genomic.fa -> snakemake_split/mag_split/split_8/UBA1062_genomic.fa
snakemake_split/mags/UBA1087_genomic.fa -> snakemake_split/mag_split/split_8/UBA1087_genomic.fa
snakemake_split/mags/UBA1064_genomic.fa -> snakemake_split/mag_split/split_8/UBA1064_genomic.fa
snakemake_split/mags/UBA1056_genomic.fa -> snakemake_split/mag_split/split_8/UBA1056_genomic.fa
snakemake_split/mags/UBA1007_genomic.fa -> snakemake_split/mag_split/split_8/UBA1007_genomic.fa
snakemake_split/mags/UBA1060_genomic.fa -> snakemake_split/mag_split/split_8/UBA1060_genomic.fa
snakemake_split/mags/UBA1039_genomic.fa -> snakemake_split/mag_split/split_8/UBA1039_genomic.fa
snakemake_split/mags/UBA1008_genomic.fa -> snakemake_split/mag_split/split_8/UBA1008_genomic.fa
Successfully created the directory mag_split/split_9
snakemake_split/mags/UBA1092_genomic.fa -> snakemake_split/mag_split/split_9/UBA1092_genomic.fa
snakemake_split/mags/UBA1076_genomic.fa -> snakemake_split/mag_split/split_9/UBA1076_genomic.fa
snakemake_split/mags/UBA1006_genomic.fa -> snakemake_split/mag_split/split_9/UBA1006_genomic.fa
snakemake_split/mags/UBA1058_genomic.fa -> snakemake_split/mag_split/split_9/UBA1058_genomic.fa
snakemake_split/mags/UBA1002_genomic.fa -> snakemake_split/mag_split/split_9/UBA1002_genomic.fa


Building DAG of jobs...
Job counts:
        count   jobs
        1       all
        10      checkm
        1       checkm_data
        12

[Sat Feb 26 10:12:49 2022]
localrule checkm_data:
    output: checkm_data
    jobid: 2


                mkdir -p checkm_data
                cd checkm_data
                wget https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_2015_01_16.tar.gz
                gunzip < checkm_data_2015_01_16.tar.gz | tar xvf -
                cd ..
                echo checkm_data | checkm data setRoot checkm_data


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_1, checkm_data
    output: checkm/split_1, checkm/split_1/checkm.tsv
    jobid: 1
    wildcards: split=split_1


                checkm lineage_wf --tab_table -f checkm/split_1/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_1 checkm/split_1


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_3, checkm_data
    output: checkm/split_3, checkm/split_3/checkm.tsv
    jobid: 5
    wildcards: split=split_3


                checkm lineage_wf --tab_table -f checkm/split_3/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_3 checkm/split_3


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_6, checkm_data
    output: checkm/split_6, checkm/split_6/checkm.tsv
    jobid: 4
    wildcards: split=split_6


                checkm lineage_wf --tab_table -f checkm/split_6/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_6 checkm/split_6


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_8, checkm_data
    output: checkm/split_8, checkm/split_8/checkm.tsv
    jobid: 7
    wildcards: split=split_8


                checkm lineage_wf --tab_table -f checkm/split_8/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_8 checkm/split_8


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_4, checkm_data
    output: checkm/split_4, checkm/split_4/checkm.tsv
    jobid: 9
    wildcards: split=split_4


                checkm lineage_wf --tab_table -f checkm/split_4/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_4 checkm/split_4


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_9, checkm_data
    output: checkm/split_9, checkm/split_9/checkm.tsv
    jobid: 11
    wildcards: split=split_9


                checkm lineage_wf --tab_table -f checkm/split_9/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_9 checkm/split_9


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_2, checkm_data
    output: checkm/split_2, checkm/split_2/checkm.tsv
    jobid: 3
    wildcards: split=split_2


                checkm lineage_wf --tab_table -f checkm/split_2/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_2 checkm/split_2


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_7, checkm_data
    output: checkm/split_7, checkm/split_7/checkm.tsv
    jobid: 6
    wildcards: split=split_7


                checkm lineage_wf --tab_table -f checkm/split_7/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_7 checkm/split_7


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_0, checkm_data
    output: checkm/split_0, checkm/split_0/checkm.tsv
    jobid: 8
    wildcards: split=split_0


                checkm lineage_wf --tab_table -f checkm/split_0/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_0 checkm/split_0


[Sat Feb 26 10:12:49 2022]
rule checkm:
    input: mag_split/split_5, checkm_data
    output: checkm/split_5, checkm/split_5/checkm.tsv
    jobid: 10
    wildcards: split=split_5


                checkm lineage_wf --tab_table -f checkm/split_5/checkm.tsv --pplacer_threads 1 -t 1 -x fa mag_split/split_5 checkm/split_5


[Sat Feb 26 10:12:49 2022]
localrule all:
    input: checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_1, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_2, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_6, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_3, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_7, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_8, checkm/split_0, checkm/split_0, checkm/split_0, checkm/split_0, checkm/split_0, checkm/split_0, checkm/split_0, checkm/split_0, checkm/split_0, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_4, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_5, checkm/split_9, checkm/split_9, checkm/split_9, checkm/split_9, checkm/split_9
    jobid: 0

Job counts:
        count   jobs
        1       all
        10      checkm
        1       checkm_data
        12
This was a dry-run (flag -n). The order of jobs does not reflect the order of execution.
```
