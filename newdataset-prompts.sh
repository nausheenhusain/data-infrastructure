#!/bin/bash
# A bash script to create a data folder for a new dataset, executed through the command `newdata`.
# Creates a directory with a slug, a data dictionary and a data diary.

# takes you to root level so that you can run the 'newdata' command from anywhere
cd
# Asks you to enter a phrase as a slug
echo "Hi! Please enter a descriptive phrase to be used as a slug for this directory."
read slug
# create a data directory if you don't have one
if [ ! -d data/ ]
then
	mkdir data/
else
	cd data/
fi

# If slug exists, asks you to start over
# If slug does not exists, creates directory with slug as directory title
if [ ! -d $slug ]
then
    echo "I'm creating a directory for your new dataset."
    mkdir $slug
    echo "I've created a new directory for your data. Answer a few questions before you start:"
else
    echo "Sorry! This slug already exists. Think of a new slug and start again with the command 'newdata'."
    cd ../../
    exit 1
fi

# asks user relevant information about the data
echo "Where did you obtain this data? (ex. UNHCR, City of Chicago, etc.)"
read source
echo "When did you obtain this data?"
read date
echo "What topic or story is this data being used for? (ex. refugee resettlement, CTA developments, etc.)"
read story
echo "Thanks! I'm creating your documents now."

# makes copy of datadict-template and datadiary-template and renames
cp datadict-template.txt datadict.txt
cp datadiary-template.txt datadiary.txt

# moves datadict and datadiary to $slug directory
mv datadict.txt $slug/
mv datadiary.txt $slug/

# enters $slug directory and adds source, date and topic to datadict.txt
cd $slug
echo "data source: $source" >> datadict.txt
echo "date obtained: $date" >> datadict.txt
echo "coverage topic: $story" >> datadict.txt

#opens entire data folder
subl .