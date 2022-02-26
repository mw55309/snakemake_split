#!/usr/bin/env python

import glob
import os
from os import path

# get a list of MAGs
mags = glob.glob("mags/*.fa")

# set counters
split=0
count=0

# create top level output dir
outpath="mag_split"
if not path.exists(outpath):
	try:
    		os.makedirs(outpath)
	except OSError:
    		print ("Creation of the directory %s failed" % outpath)
	else:
    		print ("Successfully created the directory %s " % outpath)

# empty splitpath
splitpath = ""

for m in mags:
	
	# update count
	count = count + 1

	# get the modulo
	mod = count % 10

	# create second level
	# split directory if we have a
	# mod of 0
	
	if mod == 0:
		split = split + 1
		

	# the output path for the split files
	splitpath = outpath + "/" + "split_" + str(split)

	# if splitpath doesn't exist, create it
	if not path.exists(splitpath):
		try:
			os.makedirs(splitpath)
		except OSError:
			print ("Creation of the directory %s failed" % splitpath)
		else:
			print ("Successfully created the directory %s " % splitpath)


	# create symlinks
	cwd = os.getcwd()
	basename = os.path.basename(m) 

	src = cwd + "/" + m
	dst = cwd + "/" + splitpath + "/" + basename

	print(("%s -> %s") % (src,dst))

	if not path.exists(dst):
		os.symlink(src,dst)
