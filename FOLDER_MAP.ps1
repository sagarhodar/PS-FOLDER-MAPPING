Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#region Modern Color Scheme and Styling
$ModernColors = @{
    Primary = [System.Drawing.Color]::FromArgb(0, 120, 212)      # Modern blue
    PrimaryDark = [System.Drawing.Color]::FromArgb(0, 99, 177)   # Darker blue for hover
    Background = [System.Drawing.Color]::FromArgb(248, 249, 250) # Light gray background
    CardBackground = [System.Drawing.Color]::White               # White for cards
    TextPrimary = [System.Drawing.Color]::FromArgb(32, 31, 30)   # Dark text
    TextSecondary = [System.Drawing.Color]::FromArgb(96, 94, 92) # Gray text
    Border = [System.Drawing.Color]::FromArgb(225, 223, 221)     # Light border
    Success = [System.Drawing.Color]::FromArgb(16, 124, 16)      # Green
    Error = [System.Drawing.Color]::FromArgb(196, 43, 28)        # Red
    Accent = [System.Drawing.Color]::FromArgb(0, 178, 148)       # Teal accent
}

# Function to create modern button styling
function Set-ModernButtonStyle {
    param([System.Windows.Forms.Button]$Button, [string]$Style = "Primary")
    
    $Button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $Button.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Regular)
    $Button.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    switch ($Style) {
        "Primary" {
            $Button.BackColor = $ModernColors.Primary
            $Button.ForeColor = [System.Drawing.Color]::White
            $Button.FlatAppearance.BorderSize = 0
            $Button.FlatAppearance.MouseOverBackColor = $ModernColors.PrimaryDark
        }
        "Secondary" {
            $Button.BackColor = $ModernColors.CardBackground
            $Button.ForeColor = $ModernColors.TextPrimary
            $Button.FlatAppearance.BorderColor = $ModernColors.Border
            $Button.FlatAppearance.BorderSize = 1
            $Button.FlatAppearance.MouseOverBackColor = $ModernColors.Background
        }
        "Success" {
            $Button.BackColor = $ModernColors.Success
            $Button.ForeColor = [System.Drawing.Color]::White
            $Button.FlatAppearance.BorderSize = 0
            $Button.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::FromArgb(13, 100, 13)
        }
        "Accent" {
            $Button.BackColor = $ModernColors.Accent
            $Button.ForeColor = [System.Drawing.Color]::White
            $Button.FlatAppearance.BorderSize = 0
            $Button.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::FromArgb(0, 151, 125)
        }
    }
}

# Function to create modern panel/groupbox styling
function Set-ModernPanelStyle {
    param([System.Windows.Forms.Control]$Control)
    $Control.BackColor = $ModernColors.CardBackground
    $Control.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $Control.ForeColor = $ModernColors.TextPrimary
}

# Function to create modern textbox styling
function Set-ModernTextBoxStyle {
    param([System.Windows.Forms.TextBox]$TextBox, [bool]$ReadOnly = $false)
    $TextBox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $TextBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
    if ($ReadOnly) {
        $TextBox.BackColor = $ModernColors.Background
        $TextBox.ForeColor = $ModernColors.TextSecondary
    } else {
        $TextBox.BackColor = [System.Drawing.Color]::White
        $TextBox.ForeColor = $ModernColors.TextPrimary
    }
}
#endregion

#region GUI Setup

# Create the main form with modern styling
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Folder Mapper Pro v2.0"
$Form.Size = New-Object System.Drawing.Size(900, 700)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = $ModernColors.Background
$Form.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$Form.MaximizeBox = $false

# Create title label
$TitleLabel = New-Object System.Windows.Forms.Label
$TitleLabel.Text = "FOLDER MAPPER PRO"
$TitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$TitleLabel.ForeColor = $ModernColors.Primary
$TitleLabel.Location = New-Object System.Drawing.Point(30, 20)
$TitleLabel.Size = New-Object System.Drawing.Size(300, 35)
$Form.Controls.Add($TitleLabel)

# Create subtitle label
$SubtitleLabel = New-Object System.Windows.Forms.Label
$SubtitleLabel.Text = "Professional folder structure analysis and mapping tool"
$SubtitleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$SubtitleLabel.ForeColor = $ModernColors.TextSecondary
$SubtitleLabel.Location = New-Object System.Drawing.Point(30, 50)
$SubtitleLabel.Size = New-Object System.Drawing.Size(400, 20)
$Form.Controls.Add($SubtitleLabel)

# Create main content panel
$MainPanel = New-Object System.Windows.Forms.Panel
$MainPanel.Location = New-Object System.Drawing.Point(20, 85)
$MainPanel.Size = New-Object System.Drawing.Size(850, 560)
$MainPanel.BackColor = $ModernColors.Background
$Form.Controls.Add($MainPanel)

# Source Folder Panel (Modern Card Style)
$SourcePanel = New-Object System.Windows.Forms.Panel
$SourcePanel.Location = New-Object System.Drawing.Point(10, 10)
$SourcePanel.Size = New-Object System.Drawing.Size(400, 120)
Set-ModernPanelStyle $SourcePanel
$MainPanel.Controls.Add($SourcePanel)

# Source folder label
$SourceLabel = New-Object System.Windows.Forms.Label
$SourceLabel.Text = "[>] SOURCE FOLDER"
$SourceLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$SourceLabel.ForeColor = $ModernColors.Primary
$SourceLabel.Location = New-Object System.Drawing.Point(15, 15)
$SourceLabel.Size = New-Object System.Drawing.Size(200, 25)
$SourcePanel.Controls.Add($SourceLabel)

# Source Folder TextBox
$SourceFolderTextBox = New-Object System.Windows.Forms.TextBox
$SourceFolderTextBox.Location = New-Object System.Drawing.Point(15, 45)
$SourceFolderTextBox.Size = New-Object System.Drawing.Size(280, 25)
$SourceFolderTextBox.ReadOnly = $true
$SourceFolderTextBox.Text = "Click Browse to select a folder..."
Set-ModernTextBoxStyle $SourceFolderTextBox -ReadOnly $true
$SourcePanel.Controls.Add($SourceFolderTextBox)

# Browse Source Folder Button
$BrowseSourceButton = New-Object System.Windows.Forms.Button
$BrowseSourceButton.Text = "Browse..."
$BrowseSourceButton.Location = New-Object System.Drawing.Point(305, 44)
$BrowseSourceButton.Size = New-Object System.Drawing.Size(80, 27)
Set-ModernButtonStyle $BrowseSourceButton -Style "Primary"
$SourcePanel.Controls.Add($BrowseSourceButton)

# Output Folder Panel
$OutputPanel = New-Object System.Windows.Forms.Panel
$OutputPanel.Location = New-Object System.Drawing.Point(10, 145)
$OutputPanel.Size = New-Object System.Drawing.Size(400, 120)
Set-ModernPanelStyle $OutputPanel
$MainPanel.Controls.Add($OutputPanel)

# Output folder label
$OutputLabel = New-Object System.Windows.Forms.Label
$OutputLabel.Text = "[*] OUTPUT FOLDER"
$OutputLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$OutputLabel.ForeColor = $ModernColors.Accent
$OutputLabel.Location = New-Object System.Drawing.Point(15, 15)
$OutputLabel.Size = New-Object System.Drawing.Size(200, 25)
$OutputPanel.Controls.Add($OutputLabel)

# Output Folder TextBox
$OutputFolderTextBox = New-Object System.Windows.Forms.TextBox
$OutputFolderTextBox.Location = New-Object System.Drawing.Point(15, 45)
$OutputFolderTextBox.Size = New-Object System.Drawing.Size(280, 25)
$OutputFolderTextBox.ReadOnly = $true
$OutputFolderTextBox.Text = "Auto-selected based on source folder"
Set-ModernTextBoxStyle $OutputFolderTextBox -ReadOnly $true
$OutputPanel.Controls.Add($OutputFolderTextBox)

# Browse Output Folder Button
$BrowseOutputButton = New-Object System.Windows.Forms.Button
$BrowseOutputButton.Text = "Browse..."
$BrowseOutputButton.Location = New-Object System.Drawing.Point(305, 44)
$BrowseOutputButton.Size = New-Object System.Drawing.Size(80, 27)
Set-ModernButtonStyle $BrowseOutputButton -Style "Secondary"
$OutputPanel.Controls.Add($BrowseOutputButton)

# Action Buttons Panel
$ActionPanel = New-Object System.Windows.Forms.Panel
$ActionPanel.Location = New-Object System.Drawing.Point(10, 280)
$ActionPanel.Size = New-Object System.Drawing.Size(400, 60)
Set-ModernPanelStyle $ActionPanel
$MainPanel.Controls.Add($ActionPanel)

# Map Folder Button
$MapFolderButton = New-Object System.Windows.Forms.Button
$MapFolderButton.Text = "ANALYZE"
$MapFolderButton.Location = New-Object System.Drawing.Point(15, 15)
$MapFolderButton.Size = New-Object System.Drawing.Size(90, 35)
Set-ModernButtonStyle $MapFolderButton -Style "Primary"
$ActionPanel.Controls.Add($MapFolderButton)

# Refresh Button
$RefreshButton = New-Object System.Windows.Forms.Button
$RefreshButton.Text = "REFRESH"
$RefreshButton.Location = New-Object System.Drawing.Point(115, 15)
$RefreshButton.Size = New-Object System.Drawing.Size(80, 35)
Set-ModernButtonStyle $RefreshButton -Style "Secondary"
$ActionPanel.Controls.Add($RefreshButton)

# Export Button
$ExportButton = New-Object System.Windows.Forms.Button
$ExportButton.Text = "EXPORT"
$ExportButton.Location = New-Object System.Drawing.Point(205, 15)
$ExportButton.Size = New-Object System.Drawing.Size(75, 35)
Set-ModernButtonStyle $ExportButton -Style "Success"
$ActionPanel.Controls.Add($ExportButton)

# Exit Button
$ExitButton = New-Object System.Windows.Forms.Button
$ExitButton.Text = "EXIT"
$ExitButton.Location = New-Object System.Drawing.Point(290, 15)
$ExitButton.Size = New-Object System.Drawing.Size(65, 35)
Set-ModernButtonStyle $ExitButton -Style "Secondary"
$ActionPanel.Controls.Add($ExitButton)

# Tree Preview Panel
$TreePanel = New-Object System.Windows.Forms.Panel
$TreePanel.Location = New-Object System.Drawing.Point(430, 10)
$TreePanel.Size = New-Object System.Drawing.Size(410, 530)
Set-ModernPanelStyle $TreePanel
$MainPanel.Controls.Add($TreePanel)

# Tree preview label
$TreeLabel = New-Object System.Windows.Forms.Label
$TreeLabel.Text = "FOLDER STRUCTURE PREVIEW"
$TreeLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$TreeLabel.ForeColor = $ModernColors.Primary
$TreeLabel.Location = New-Object System.Drawing.Point(15, 15)
$TreeLabel.Size = New-Object System.Drawing.Size(280, 25)
$TreePanel.Controls.Add($TreeLabel)

# Stats label
$StatsLabel = New-Object System.Windows.Forms.Label
$StatsLabel.Text = "Ready to analyze..."
$StatsLabel.Font = New-Object System.Drawing.Font("Segoe UI", 8)
$StatsLabel.ForeColor = $ModernColors.TextSecondary
$StatsLabel.Location = New-Object System.Drawing.Point(15, 40)
$StatsLabel.Size = New-Object System.Drawing.Size(380, 20)
$TreePanel.Controls.Add($StatsLabel)

# Tree View TextBox with modern styling
$TreePreviewTextBox = New-Object System.Windows.Forms.TextBox
$TreePreviewTextBox.Location = New-Object System.Drawing.Point(15, 65)
$TreePreviewTextBox.Size = New-Object System.Drawing.Size(380, 450)
$TreePreviewTextBox.Multiline = $true
$TreePreviewTextBox.ScrollBars = "Both"
$TreePreviewTextBox.ReadOnly = $true
$TreePreviewTextBox.Font = New-Object System.Drawing.Font("Consolas", 9)
$TreePreviewTextBox.BackColor = [System.Drawing.Color]::FromArgb(245, 245, 245)
$TreePreviewTextBox.ForeColor = $ModernColors.TextPrimary
$TreePreviewTextBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$TreePreviewTextBox.Text = ">> Select a source folder and click 'ANALYZE' to view the structure...`n`n   TIPS:`n   • Use the Browse button to select folders`n   • Exported files include timestamps`n   • Both TXT and CSV formats supported`n   • Large folders may take a moment to analyze"
$TreePanel.Controls.Add($TreePreviewTextBox)

# Status bar at bottom
$StatusBar = New-Object System.Windows.Forms.StatusStrip
$StatusBar.BackColor = $ModernColors.CardBackground
$StatusBar.Font = New-Object System.Drawing.Font("Segoe UI", 8)
$Form.Controls.Add($StatusBar)

$StatusLabel = New-Object System.Windows.Forms.ToolStripStatusLabel
$StatusLabel.Text = "Ready - Select a folder to begin analysis"
$StatusLabel.ForeColor = $ModernColors.TextSecondary
$StatusBar.Items.Add($StatusLabel) | Out-Null

#endregion

#region Helper Functions

# Enhanced folder tree function with statistics
function Get-FolderTree {
    param (
        [string]$Path,
        [int]$Level = 0,
        [string]$Prefix = "",
        [ref]$FolderCount,
        [ref]$FileCount
    )

    $TreeOutput = @()

    if ($Level -eq 0) {
        $TreeOutput += "[ROOT] $Path"
        $TreeOutput += "=" * 60
    }

    try {
        $directories = Get-ChildItem -Path $Path -Directory -ErrorAction SilentlyContinue | Sort-Object Name
        $files = Get-ChildItem -Path $Path -File -ErrorAction SilentlyContinue | Sort-Object Name
        
        $totalItems = $directories.Count + $files.Count
        $currentItem = 0

        # Process directories first
        foreach ($dir in $directories) {
            $currentItem++
            $FolderCount.Value++
            
            $isLastDir = ($currentItem -eq $directories.Count)
            $isLastOverall = ($currentItem -eq $totalItems)
            
            if ($isLastOverall) {
                $connector = "└── "
                $nextPrefix = "$Prefix      "
            } else {
                $connector = "├── "
                $nextPrefix = "$Prefix│      "
            }
            
            $TreeOutput += "$Prefix$connector[DIR] $($dir.Name)"
            $subTree = Get-FolderTree -Path $dir.FullName -Level ($Level + 1) -Prefix $nextPrefix -FolderCount $FolderCount -FileCount $FileCount
            $TreeOutput += $subTree
        }

        # Process files
        foreach ($file in $files) {
            $currentItem++
            $FileCount.Value++
            
            $isLast = $currentItem -eq $totalItems
            $connector = if ($isLast) { "└── " } else { "├── " }
            
            $icon = switch ($file.Extension.ToLower()) {
                ".txt" { "[TXT]" }
                ".pdf" { "[PDF]" }
                ".doc" { "[DOC]" }
                ".docx" { "[DOC]" }
                ".xls" { "[XLS]" }
                ".xlsx" { "[XLS]" }
                ".jpg" { "[IMG]" }
                ".jpeg" { "[IMG]" }
                ".png" { "[IMG]" }
                ".gif" { "[IMG]" }
                ".mp3" { "[MP3]" }
                ".mp4" { "[MP4]" }
                ".zip" { "[ZIP]" }
                ".exe" { "[EXE]" }
                default { "[FILE]" }
            }
            
            $TreeOutput += "$Prefix$connector$icon $($file.Name)"
        }

    } catch {
        $TreeOutput += "$Prefix└── [ERROR] $($_.Exception.Message)"
    }
    
    return $TreeOutput
}

# Function to browse for a folder with improved dialog
function Select-Folder {
    param([string]$InitialDirectory = "")
    
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderBrowser.Description = "Select a folder to analyze its structure"
    $FolderBrowser.ShowNewFolderButton = $false
    
    if ($InitialDirectory -and (Test-Path $InitialDirectory -PathType Container)) {
        $FolderBrowser.SelectedPath = $InitialDirectory
    }
    
    $result = $FolderBrowser.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        return $FolderBrowser.SelectedPath
    }
    return $null
}

#endregion

#region Event Handlers

$BrowseSourceButton.Add_Click({
    $StatusLabel.Text = "Browsing for source folder..."
    $selectedPath = Select-Folder
    if ($selectedPath) {
        $SourceFolderTextBox.Text = $selectedPath
        $OutputFolderTextBox.Text = $selectedPath
        $StatusLabel.Text = "Source folder selected: $(Split-Path $selectedPath -Leaf)"
        $TreePreviewTextBox.Text = ">> Source folder selected. Click 'ANALYZE' to view structure."
    } else {
        $StatusLabel.Text = "Ready - Select a folder to begin analysis"
    }
})

$BrowseOutputButton.Add_Click({
    $StatusLabel.Text = "Browsing for output folder..."
    $selectedPath = Select-Folder -InitialDirectory $OutputFolderTextBox.Text
    if ($selectedPath) {
        $OutputFolderTextBox.Text = $selectedPath
        $StatusLabel.Text = "Output folder selected: $(Split-Path $selectedPath -Leaf)"
    } else {
        $StatusLabel.Text = "Ready - Select a folder to begin analysis"
    }
})

$MapFolderButton.Add_Click({
    if ([string]::IsNullOrEmpty($SourceFolderTextBox.Text) -or $SourceFolderTextBox.Text -eq "Click Browse to select a folder...") {
        [System.Windows.Forms.MessageBox]::Show("Please select a source folder first.", "No Source Folder", "OK", "Warning")
        return
    }
    
    $StatusLabel.Text = "Analyzing folder structure..."
    $Form.Text = "Folder Mapper Pro v2.0 (Analyzing...)"
    $TreePreviewTextBox.Text = ">> Analyzing folder structure, please wait...`n`n   This may take a moment for large directories."
    [System.Windows.Forms.Application]::DoEvents()

    $sourceFolder = $SourceFolderTextBox.Text
    $folderCount = [ref]0
    $fileCount = [ref]0
    
    $startTime = Get-Date
    $tree = Get-FolderTree -Path $sourceFolder -FolderCount $folderCount -FileCount $fileCount
    $endTime = Get-Date
    $duration = ($endTime - $startTime).TotalSeconds
    
    $TreePreviewTextBox.Text = ($tree | Out-String)
    $StatsLabel.Text = "[STATS] Analysis complete: $($folderCount.Value) folders, $($fileCount.Value) files (${duration:F1}s)"
    $StatusLabel.Text = "Analysis complete - Ready to export results"
    $Form.Text = "Folder Mapper Pro v2.0"
})

$RefreshButton.Add_Click({
    $MapFolderButton.PerformClick()
})

$ExportButton.Add_Click({
    if ([string]::IsNullOrEmpty($SourceFolderTextBox.Text) -or $SourceFolderTextBox.Text -eq "Click Browse to select a folder...") {
        [System.Windows.Forms.MessageBox]::Show("No folder structure to export. Please analyze a folder first.", "Nothing to Export", "OK", "Warning")
        return
    }
    if ([string]::IsNullOrEmpty($OutputFolderTextBox.Text)) {
        [System.Windows.Forms.MessageBox]::Show("Please select an output folder for the export.", "No Output Folder", "OK", "Warning")
        return
    }

    $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
    $SaveFileDialog.Filter = "Text File (*.txt)|*.txt|CSV File (*.csv)|*.csv|All Files (*.*)|*.*"
    $SaveFileDialog.Title = "Save Folder Structure Map"
    $SaveFileDialog.InitialDirectory = $OutputFolderTextBox.Text
    $SaveFileDialog.FileName = "FolderMap_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

    if ($SaveFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $outputPath = $SaveFileDialog.FileName
        $StatusLabel.Text = "Exporting folder map..."
        
        try {
            if ($outputPath.EndsWith(".csv", [System.StringComparison]::OrdinalIgnoreCase)) {
                $sourceFolder = $SourceFolderTextBox.Text
                $csvHeader = "FullPath,Name,Type,LastWriteTime,Size"
                $csvHeader | Out-File -FilePath $outputPath -Encoding UTF8
                
                Get-ChildItem -Path $sourceFolder -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
                    $type = if ($_.PSIsContainer) { "Folder" } else { "File" }
                    $size = if ($_.PSIsContainer) { "" } else { $_.Length }
                    "$($_.FullName),$($_.Name),$type,$($_.LastWriteTime),$size"
                } | Out-File -FilePath $outputPath -Append -Encoding UTF8
            } else {
                # Add header information to TXT export
                $header = @"
Folder Structure Map
Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
Source: $($SourceFolderTextBox.Text)
$($StatsLabel.Text)

$('=' * 50)

"@
                $header + $TreePreviewTextBox.Text | Out-File -FilePath $outputPath -Encoding UTF8
            }
            
            $StatusLabel.Text = "Export completed successfully"
            [System.Windows.Forms.MessageBox]::Show("Folder map exported successfully!`n`nFile: $(Split-Path $outputPath -Leaf)`nLocation: $(Split-Path $outputPath -Parent)", "Export Complete", "OK", "Information")
        } catch {
            $StatusLabel.Text = "Export failed"
            [System.Windows.Forms.MessageBox]::Show("Error exporting folder map:`n$($_.Exception.Message)", "Export Error", "OK", "Error")
        }
    }
})

$ExitButton.Add_Click({
    $Form.Close()
})

# Add form closing event for cleanup
$Form.Add_FormClosing({
    $StatusLabel.Text = "Shutting down..."
})

#endregion

# Display the form
$Form.Add_Shown({$StatusLabel.Text = "Application ready - Select a source folder to begin"})
[void]$Form.ShowDialog()