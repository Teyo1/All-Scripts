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
