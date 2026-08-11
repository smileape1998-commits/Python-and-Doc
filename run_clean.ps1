$path = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_05_List_Processing\01_Lecture_List_Processing.ipynb"
$text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$text = $text.Replace("`n", "\n").Replace("\u0007", "a")
$nb = $text | ConvertFrom-Json
$jsonOut = $nb | ConvertTo-Json -Depth 100
[System.IO.File]::WriteAllText($path, $jsonOut, [System.Text.Encoding]::UTF8)
Write-Host "CLEANED STRAY CHARACTERS VIA POWERSHELL SUCCESSFULLY!"
