$base = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2"

$modules = @(
    "Module_01_DataType_and_Expression",
    "Module_02_Basic_String_and_List",
    "Module_03_Selection",
    "Module_04_Repetition",
    "Module_05_List_Processing",
    "Module_06_Function",
    "Module_07_String_Processing",
    "Module_08_Basic_Dict"
)

foreach ($m in $modules) {
    Write-Host "==================== $m ===================="
    $lecDir = Join-Path $base "$m\Lectures"
    if (Test-Path $lecDir) {
        $existing = Get-ChildItem -Path $lecDir | Select-Object -ExpandProperty Name
        Write-Host "Existing in Lectures: $($existing -join ', ')"
    }
    
    $nbFiles = Get-ChildItem -Path (Join-Path $base $m) -Filter "01_Lecture_*.ipynb"
    if ($nbFiles.Count -eq 0) { continue }
    
    $nbPath = $nbFiles[0].FullName
    Write-Host "Main notebook: $($nbFiles[0].Name)"
    
    $raw = Get-Content $nbPath -Raw -Encoding UTF8
    $nb = $raw | ConvertFrom-Json
    
    $cellIdx = 0
    foreach ($cell in $nb.cells) {
        if ($cell.cell_type -eq "markdown") {
            $text = $cell.source -join ""
            $lines = $text -split "`n"
            foreach ($line in $lines) {
                if ($line.Trim().StartsWith("#")) {
                    Write-Host ("  Cell {0,2}: {1}" -f $cellIdx, $line.Trim())
                }
            }
        }
        $cellIdx++
    }
}
