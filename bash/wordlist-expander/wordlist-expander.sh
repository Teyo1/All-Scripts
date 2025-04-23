#!/bin/bash

# A script to append sequences of numbers to words in a given dictionary file.

# Check if an input file was provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Validate the input file
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' does not exist."
    exit 1
fi

# Define output file name based on the input file
output_file="modified_${input_file##*/}"

# Clear the output file if it already exists
> "$output_file"

# Process each word from the input file
while IFS= read -r word; do
    # Append the word with numbers 0-99
    for i in $(seq 0 99); do
        echo "${word}${i}" >> "$output_file"
    done

    # Append the word with numbers 00-99
    for i in $(seq -w 0 99); do
        echo "${word}${i}" >> "$output_file"
    done

    # Append the word with numbers 000-999
    for i in $(seq -w 0 999); do
        echo "${word}${i}" >> "$output_file"
    done
done < "$input_file"

echo "Sequences have been appended to each word in '$input_file' and written to '$output_file'."
