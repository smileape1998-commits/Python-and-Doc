$pyFile = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\update_sec_5_1.py"
$pyCode = [System.IO.File]::ReadAllText($pyFile, [System.Text.Encoding]::UTF8)

# Execute via powershell python call or python script execution
powershell -Command "python '$pyFile'"
