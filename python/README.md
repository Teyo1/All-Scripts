Python Scripts Collection
=========================

This is a collection of various Python scripts designed for general-purpose tasks such as automation, data parsing, file operations, hashing utilities, and more. Each script is standalone and easy to run.

------------------------------------------------------------

Features
--------

- Simple, self-contained Python scripts
- Clear terminal output
- Focused on speed, readability, and efficiency
- No frameworks – just Python and optionally small libraries like `tqdm`, `argparse`, etc.
- Modular and easy to expand

------------------------------------------------------------

Requirements
------------

- Python 3.6 or newer

Some scripts may also require:
- `tqdm` for progress bars
- `requests` for web access
- `hashid` for hash detection
- `argparse` for CLI usage (built-in)

To install dependencies (if needed):

    pip install -r requirements.txt

Or individually:

    pip install tqdm requests hashid

------------------------------------------------------------

Usage
-----

Each script is run independently. Make sure you're in the same directory, then run:

    python3 script_name.py

Some scripts support command-line arguments. Example:

    python3 downloader.py --url https://example.com --out file.txt

Scripts with progress bars will automatically show ETA, speed, and status.

------------------------------------------------------------

------------------------------------------------------------

License
-------

MIT License – Open-source, free to use and modify. No warranty.

------------------------------------------------------------
