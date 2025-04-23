# Wordlist Modifier Script

## Information

This repository contains a script to modify a wordlist by appending sequences of numbers to each word. It is useful for generating lists with different combinations of words and numbers.

- **Script Name:** `create-wordlist.sh`
- **Purpose:** To read words from an input file and generate an output file with each word appended by numbers in various formats.
- **License:** MIT License

## Script

The `create-wordlist.sh` script reads a list of words from the specified input file and generates an output file where each word is appended with numbers in the following formats:
- Numbers from 0 to 99
- Numbers from 00 to 99 (with leading zeros)
- Numbers from 000 to 999 (with leading zeros)

### Script Code

```bash
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
```

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/teyo1/wordlist-modifier.git
   ```

2. **Navigate to the directory**:
   ```bash
   cd wordlist-modifier
   ```

3. **Make the script executable**:
   ```bash
   chmod +x create-wordlist.sh
   ```

4. **Run the script**:
   ```bash
   ./create-wordlist.sh <input_file>
   ```

   Replace `<input_file>` with the path to your input file. The script will create an output file prefixed with `modified_`.

### Example

If your `dictionary-list.txt` contains:
```
word1
word2
```

Running the script:
```bash
./create-wordlist.sh dictionary-list.txt
```

Will produce an output file `modified_dictionary-list.txt` with content like:
```
word100
word101
...
word199
word200
word201
...
word299
word1000
word1001
...
word1999
```
