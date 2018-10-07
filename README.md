This is a shell script that creates a directory for a new dataset and adds a data dictionary and data diary to the directory after asking you some questions. I built this to ensure that each dataset I work with has the appropriate meta-data with it; I'm hoping it'll help me keep track of how I work with my data.

As this process exists on my machine currently, `newdataset.sh` lives in my root directory, and `datadict-template.txt` and `datadiary.txt` live in `/Desktop/data/`.

I've added the following line to my `.bash_profile` to run this script with the command newdata:

`alias newdata='bash newdataset.sh'`