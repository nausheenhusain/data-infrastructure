This is a shell script that creates a directory for a new dataset and adds a data dictionary and data diary to the directory after asking you some questions.

As this process exists on my machine currently, `newdataset.sh` lives in my root directory, and `datadict-template.txt` and `datadiary.txt` live in `/Desktop/data/`.

I've added the following line to my `.bash_profile` to run this script with the command newdata:

`alias newdata='bash newdataset.sh'`