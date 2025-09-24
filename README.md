# 🗂️ PowerShell Folder Mapper Pro

<div align="center">

![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![.NET](https://img.shields.io/badge/.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green.svg?style=for-the-badge)
![Version](https://img.shields.io/badge/version-2.0-blue.svg?style=for-the-badge)

[![Stars](https://img.shields.io/github/stars/username/folder-mapper-pro?style=social)](https://github.com/username/folder-mapper-pro/stargazers)
[![Forks](https://img.shields.io/github/forks/username/folder-mapper-pro?style=social)](https://github.com/username/folder-mapper-pro/network/members)
[![Issues](https://img.shields.io/github/issues/username/folder-mapper-pro)](https://github.com/username/folder-mapper-pro/issues)

**A professional GUI tool for analyzing and mapping folder structures with modern design.**

</div>

## ✨ Features

- **Modern UI** - Clean design with professional styling and intuitive navigation
- **Smart Analysis** - Recursive directory scanning with file type recognition
- **Multiple Exports** - TXT and CSV formats with detailed metadata and timestamps
- **Performance Metrics** - Real-time statistics including folder/file counts and scan duration
- **Error Handling** - Graceful recovery from permission issues and inaccessible directories

## 🚀 Quick Start

### Requirements
- Windows 10/11
- PowerShell 5.1+
- .NET Framework 4.5+

### Installation & Usage

```powershell
# Download and run
Invoke-WebRequest -Uri "https://github.com/username/folder-mapper-pro/raw/main/FolderMapperPro.ps1" -OutFile "FolderMapperPro.ps1"
.\FolderMapperPro.ps1
```

### How to Use
1. Click **Browse** to select source folder
2. Click **ANALYZE** to scan directory structure  
3. Click **EXPORT** to save results (TXT/CSV)

## 📊 Example Output

```
[ROOT] C:\MyProject
============================================================
├── [DIR] src
│   ├── [FILE] app.js
│   └── [CSS] style.css
├── [DIR] docs
│   └── [TXT] README.md
└── [JSON] package.json
```

## 🛠️ Advanced Usage

```powershell
# Command line mode (coming soon)
.\FolderMapperPro.ps1 -SourcePath "C:\MyFolder" -AutoAnalyze -Format CSV
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

<div align="center">
Made with ❤️ for better file organization
</div>
