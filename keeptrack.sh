#!/bin/bash
# A bash script to record a new FOIA or source, executed through the command `keeptrack`.
# Creates variables for relevant information and then pushes to Google Sheet.


# takes you to root level so that you can run the 'newdata' command from anywhere
cd

# asks user what they want to keep track of
echo "Hi! Do you have a new FOIA or a new SOURCE?"
read tab

# depending on FOIA or source, asks for appropriate variables
if [ $tab=="FOIA" ]
	echo "When did you send this FOIA?"
	read foia-date
	echo "Where did you send this FOIA?"
	read foia-agency
	echo "Is this a state or federal agency?"
	read foia-agency-level
	echo "When do you expect a response?"
	read foia-response
	echo "What is this story about?"
	read foia-summary
	# creates list with all variables
	foia-list="foia-date foia-agency foia-agency-level foia-response foia-summary"
	echo "Does this look right?" $foia-list
	read answer
	if [ $answer=="yes" ]
		echo "Great. Uploading..."
		export-list = foia-list
	else
		echo "Whoops! Try again with the command 'keeptrack'."
		exit 1
	fi
else
	echo "What is the name of this source?"
	read source-name
	echo "Where are they located?"
	read source-city
	echo "What is their email address?"
	read source-email
	echo "What is their phone number?"
	read source-phone
	echo "What is their title?"
	read source-title
	echo "Where do they work?"
	read source-org
	echo "What can they speak to?"
	read source-topics
	echo "Do you have a link on their background?"
	read source-background
	echo "Did you publish a story in which they are a quoted source?"
	read source-link
	echo "Do you have any additional notes on them?"
	read source-notes
	# creates list with all variables
	source-list="source-name source-city source-email source-phone source-title source-org source-topics source-background source-link source-notes"
	echo "Does this look right?" $source-list
	read answer
	if [ $answer=="yes" ]
		echo "Great. Uploading..."
		export-list = source-list
	else
		echo "Whoops! Try again with the command 'keeptrack'."
		exit 1
	fi
fi

export export-list
python send-to-sheet.py

# end
echo "I've pushed everything to the Sheet."