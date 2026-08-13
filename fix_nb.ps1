$path = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_07_String_Processing\01_Lecture_String_Processing.ipynb"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -like '*# \"''*Hello*') {
        Write-Host "Found line $($i+1): $($lines[$i])"
        $lines[$i] = '    "print(s)           # \"''\\Hello\\\\\"\n"'
    }
}

[System.IO.File]::WriteAllLines($path, $lines, [System.Text.Encoding]::UTF8)

try {
    $raw = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $json = $raw | ConvertFrom-Json
    Write-Host "SUCCESS: 01_Lecture_String_Processing.ipynb is valid JSON!"
} catch {
    Write-Host "ERROR: " $_.Exception.Message
}
