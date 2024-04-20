#!/bin/bash

# Loop through all mkv files in the current directory
for file in *.mkv
do
  # Define output file name by replacing the extension
  output="${file%.mkv}.mp4"
  
  # Run FFmpeg command
  ffmpeg -i "$file" -codec copy "$output"
  
  echo "Converted $file to $output"
done

