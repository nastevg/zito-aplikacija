@echo off
setlocal

set "DOTNET_ROOT=%USERPROFILE%\.dotnet"
set "PATH=%DOTNET_ROOT%;%PATH%"

echo Starting ArtikliApi on http://0.0.0.0:1880 ...
dotnet ArtikliApi.dll --urls "http://0.0.0.0:1880"

endlocal
