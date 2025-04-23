# Duplicate Image Finder and Remover Script (MD5 Edition)

This PowerShell script scans a specified directory (and its subdirectories), calculates the **MD5 hash** of each image file, and deletes any duplicate images based on the hash comparison.

## Features
- **Directory Scanning**: Scans the directory where the script is located (`$PSScriptRoot`) for image files in formats like `.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`, `.tiff`, `.heic`, and `.webp`.
- **MD5 Hash Calculation**: Computes the MD5 hash of each image to identify duplicates by file content.
- **Duplicate Detection**: Detects duplicate files by comparing their hash values.
- **File Deletion**: Deletes duplicate files and outputs their names in the console.

## Requirements
- PowerShell 5.1 or higher (or PowerShell Core).
- The script should be placed in the directory you want to scan for duplicate images.
- Sufficient permissions to delete files.

## How It Works
1. The script scans the current directory (and all subdirectories) for image files.
2. It calculates the MD5 hash of each image.
3. It stores the hash values in a hashtable.
4. If a duplicate is found (i.e., a file with the same hash already exists), it deletes the duplicate.
5. The script then outputs a summary indicating completion.

## Script Code

```powershell
# Define the directory to scan (set to the current script directory)
$Directory = $PSScriptRoot

# Function to calculate the MD5 hash of a file
function Get-FileHashValue {
    param([string]$FilePath)
    $Hash = Get-FileHash -Path $FilePath -Algorithm MD5
    return $Hash.Hash
}

# Initialize an empty hash table to store file hashes
$FileHashes = @{}

# Get all image files (you can add more extensions if needed)
$Files = Get-ChildItem -Path $Directory -Recurse -File | Where-Object { $_.Extension -match "jpg|jpeg|png|gif|bmp|tiff|heic|webp" }

# Iterate over each file in the directory
foreach ($File in $Files) {
    # Calculate the file's hash
    $FileHash = Get-FileHashValue -FilePath $File.FullName
    
    # Check if the hash is already in the hash table
    if ($FileHashes.ContainsKey($FileHash)) {
        # Duplicate found, delete the file
        Remove-Item -Path $File.FullName -Force
        Write-Output "Deleted duplicate file: $($File.Name)"
    } else {
        # Store the hash in the hash table
        $FileHashes[$FileHash] = $File.FullName
    }
}

Write-Output "Duplicate check complete."
