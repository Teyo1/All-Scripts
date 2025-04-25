Hash Type Aggregator
====================

This script scans through all `.txt` files in the current directory, detects hashes line-by-line,
determines their types using `hashid`, and outputs a summary of the detected hash types with their counts.
It uses `tqdm` to display a progress bar and estimated time remaining.

------------------------------------------------------------

Features
--------

- Scans multiple `.txt` files in current directory
- Detects hash types using `hashid`
- Skips blank or duplicate lines
- Shows progress bar with ETA (via `tqdm`)
- Summarizes total counts per hash type at the end

------------------------------------------------------------

Requirements
------------

- Python 3.6 or newer
- `hashid` Python module
- `tqdm` module for progress bar

To install dependencies:

    pip install hashid tqdm

Note: If your system's `hashid` conflicts with the Python module,
you may want to install the correct one from:
https://github.com/psypanda/hashID

------------------------------------------------------------

Usage
-----

Make sure your `.txt` files with hashes are in the same directory.
Run the script like this:

    python3 new_checker.py

The script will automatically:

- Load all `.txt` files
- Parse and deduplicate all hash lines
- Check each hash type using hashid
- Count and display totals

------------------------------------------------------------

Example Output
--------------

    Scanning hashes from: *.txt

    Loading from: NTLM_hashes.txt
    Total unique hashes: 2377220

    Checking hashes:  63%|█████████████████     | 1.5M/2.3M [00:34<00:20, 39.5k hash/s]

    ====== Hash Type Counts ======

    Hash Type                                    Count
    -------------------------------------------  ------
    NTLM                                         1943950
    MD5                                          302370
    SHA1                                         1300

------------------------------------------------------------

License
-------

MIT License – Free to use, modify, and distribute. No warranty.

------------------------------------------------------------
