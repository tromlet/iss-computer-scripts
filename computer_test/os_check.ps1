# Runs the system file checker
sfc.exe /scannow

# Check the currently-running image for problems, and correct them.
Dism.exe /Online /cleanup-image /restorehealth