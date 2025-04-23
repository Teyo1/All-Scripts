# 🗂️ Photo Organizer PowerShell Script

This PowerShell script organizes photos in a directory by moving them into subfolders based on the **year and month** of their creation date. It extracts this information from the image's **EXIF metadata** when available, or defaults to the file’s `LastWriteTime`. After moving files, it also cleans up any **empty folders** left behind.

---

## 🚀 Features

- **📁 Automatic Folder Creation**  
  Creates subfolders like `2024-12`, `2023-07`, etc., based on photo dates.
  
- **📷 EXIF Metadata Support**  
  Extracts the `DateTimeOriginal` from image metadata for accurate organization.

- **🔄 Smart Fallback**  
  If EXIF data is missing, it uses the file’s `LastWriteTime` instead.

- **🧠 Duplicate Handling**  
  Overwrites files if they already exist in the target folder. *(You can add logic to skip or rename instead if preferred.)*

- **🧹 Empty Folder Cleanup**  
  Deletes unused folders after moving all photos.

---

## ✅ Requirements

- Windows PowerShell
- .NET-compatible PowerShell environment (uses `System.Drawing.Image`)
- Photos should be in the **same folder as the script**

---

## 📦 Supported File Types

`.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`, `.tiff`, `.heic`, `.webp`

---

## 🛠️ How to Use

1. Save the script as `organize-photos.ps1`.
2. Place it in the folder containing your photos.
3. Open PowerShell and run:

```powershell
.\organize-photos.ps1
```

4. The script will move images into subfolders organized by `YYYY-MM`, e.g.:

```
/YourPhotos/
├── 2024-12/
│   ├── photo1.jpg
│   └── photo2.jpg
├── 2023-08/
│   └── holiday.png
```

---

## 💡 Tips

- Want to **prevent overwriting**? Add a file existence check before moving.
- Want to **process nested folders** too? Modify the file fetch to use `-Recurse`.

---

## 📜 License

MIT — Free to use and modify.

---

## 🤝 Contributions

Pull requests are welcome! Ideas for improvement:
- Custom date formats
- Preview mode before moving
- Drag-and-drop GUI
