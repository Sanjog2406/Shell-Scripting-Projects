#!/bin/bash

# Set the directory where to search for subdirectories
search_directory="your directory where you want to search the file e.g. /destop/downloads"

# Set the directory where compressed files will be stored
backup_directory="directory where you want to store the archived data"

# Create the backup directory if it does not exist
if [ ! -d "$backup_directory" ]; then
    mkdir -p "$backup_directory"
    echo "Created backup directory: $backup_directory"
fi

# Find all immediate subdirectories in the search directory
find "$search_directory" -mindepth 1 -maxdepth 1 -type d | while IFS= read -r current_dir
do
    # Get the size of the current directory in Megabytes
    dir_size=$(du -sm "$current_dir" | awk '{print $1}') #cut -f1 is also used instead of awk '{print $1}

    # Check if directory size is greater than 20 MB
    if [ "$dir_size" -gt 20 ]; then
        # Extract the base name of the directory (e.g., Documents)
        dir_name=$(basename "$current_dir")

        # Define the name of the archive file
        archive_name="$dir_name.tar.gz"
	 echo "Archival running......... : $dir_name"
        # Compress the directory and save it into the backup directory
        tar -czf "$backup_directory/$archive_name" -C "$(dirname "$current_dir")" "$dir_name"
        
        echo "Archived: $dir_name ($dir_size MB)"
         
    else
        echo "Skipped: $(basename "$current_dir") (Only $dir_size MB)"
    fi
done


# I also added this script to crontab which automatically runs at 12:17 every day


