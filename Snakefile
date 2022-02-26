shell.executable("/bin/bash")
shell.prefix("source $HOME/.bashrc; ")

import glob
import os
from functions import split_mags
from os import path

# get a list of MAGs
mags = glob.glob("mags/*.fa")

# split MAGs into groups of ten
split_mags(mags,10)


localrules: checkm_data


SPL,DUM, = glob_wildcards("mag_split/{split}/{dummy}.fa")


rule all:
	input: expand("checkm/{sample}", sample=SPL)



rule checkm_data:
	output: "checkm_data"
	conda: "checkm.yaml"
	shell:
		'''
		mkdir -p {output}
		cd {output}
		wget https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_2015_01_16.tar.gz
		gunzip < checkm_data_2015_01_16.tar.gz | tar xvf -
		cd ..
		echo checkm_data | checkm data setRoot checkm_data
		'''

rule checkm:
	input:
		gin="mag_split/{split}",
		dat=ancient("checkm_data")
	output:
		dir=directory("checkm/{split}"),
		tsv="checkm/{split}/checkm.tsv"
	threads: 8
	conda: "checkm.yaml"
	shell:
		'''
		checkm lineage_wf --tab_table -f {output.tsv} --pplacer_threads 1 -t {threads} -x fa {input.gin} {output.dir}
		'''



