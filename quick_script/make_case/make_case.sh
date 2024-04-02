
#!/bin/bash

working_dir=$(pwd)

the_date=$(date "+%m.%d.%y")

echo "$working_dir/$the_date"


# checks and creates day file if not existing
if [ -d $working_dir/$the_date ]; then
    echo "New Case For $the_date"
else
    echo "New File For Today $the_date"
    mkdir $working_dir/$the_date
fi

# set the new working directory path
working_dir=$working_dir/$the_date

# loops throught the days thing and creates a case number
name="case"
if [[ -d $working_dir/$name"01" ]] ; then
    i=1
    pretty_i=$(printf %02d $i)
    while [[ -d $working_dir/$name$pretty_i ]] ; do
	let i++
	pretty_i=$(printf %02d $i)
    done
    pretty_i=$(printf %02d $i)
    name=$name$pretty_i
else
    name=$name"01"
fi

# set the working directory again
working_dir=$working_dir/$name
mkdir $working_dir
echo "case file made"

# make the docx file and images folder
touch $working_dir/writeup.docx
mkdir $working_dir/images


