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
