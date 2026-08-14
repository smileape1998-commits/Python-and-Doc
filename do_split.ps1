$baseDir = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2"

$configs = @(
    @{
        folder = "Module_05_List_Processing"
        lectureFile = "01_Lecture_List_Processing.ipynb"
        prefix = "5"
        sections = @{
            "5.1" = "5_1_Basic_List_Operation.ipynb"
            "5.2" = "5_2_List_Method.ipynb"
            "5.3" = "5_3_Reading_Data_into_a_List.ipynb"
            "5.4" = "5_4_Accessing_Elements_One_by_One.ipynb"
            "5.5" = "5_5_Accessing_Consecutive_Elements.ipynb"
            "5.6" = "5_6_List_Searching.ipynb"
            "5.7" = "5_7_List_Sorting.ipynb"
            "5.8" = "5_8_Split_and_Join.ipynb"
        }
    },
    @{
        folder = "Module_06_Function"
        lectureFile = "01_Lecture_Function.ipynb"
        prefix = "6"
        sections = @{
            "6.1" = "6_1_Function_Call.ipynb"
            "6.2" = "6_2_Function_Definition.ipynb"
            "6.3" = "6_3_List_Processing_Function.ipynb"
            "6.4" = "6_4_Modifying_List_Parameter.ipynb"
            "6.5" = "6_5_Common_Mistake.ipynb"
        }
    },
    @{
        folder = "Module_07_String_Processing"
        lectureFile = "01_Lecture_String_Processing.ipynb"
        prefix = "7"
        sections = @{
            "7.1" = "7_1_String_Index_and_Slice.ipynb"
            "7.2" = "7_2_Escape_Char_and_String_Method.ipynb"
            "7.3" = "7_3_More_String_Processing_Examples.ipynb"
            "7.4" = "7_4_Reading_and_Writing_Files.ipynb"
        }
    },
    @{
        folder = "Module_08_Basic_Dict"
        lectureFile = "01_Lecture_Basic_Dict.ipynb"
        prefix = "8"
        sections = @{
            "8.1" = "8_1_Dict_Key_Value_Pairs.ipynb"
            "8.2" = "8_2_Modifying_Dict_Content.ipynb"
            "8.3" = "8_3_Looping_Through_Dict.ipynb"
            "8.4" = "8_4_Checking_Key_Existence.ipynb"
        }
    }
)

foreach ($cfg in $configs) {
    $folderPath = Join-Path $baseDir $cfg.folder
    $lecturePath = Join-Path $folderPath $cfg.lectureFile
    $lecturesDir = Join-Path $folderPath "Lectures"

    if (-not (Test-Path $lecturesDir)) {
        New-Item -ItemType Directory -Path $lecturesDir -Force | Out-Null
    }

    Write-Host "Reading $lecturePath..."
    $raw = Get-Content $lecturePath -Raw -Encoding UTF8
    $nb = $raw | ConvertFrom-Json

    $cells = $nb.cells
    $sectionIndices = @()

    $p = "^##\s*(" + $cfg.prefix + "\.\d+)"

    for ($i = 0; $i -lt $cells.Count; $i++) {
        $c = $cells[$i]
        if ($c.cell_type -eq "markdown") {
            $text = $c.source -join ""
            $lines = $text -split "`n"
            foreach ($l in $lines) {
                if ($l.Trim() -match $p) {
                    $secNum = $Matches[1]
                    $sectionIndices += [PSCustomObject]@{
                        SecNum = $secNum
                        Index  = $i
                    }
                    break
                }
            }
        }
    }

    Write-Host "Found $($sectionIndices.Count) sections in $($cfg.folder)"

    for ($i = 0; $i -lt $sectionIndices.Count; $i++) {
        $secNum = $sectionIndices[$i].SecNum
        $startIdx = $sectionIndices[$i].Index
        if ($i + 1 -lt $sectionIndices.Count) {
            $endIdx = $sectionIndices[$i + 1].Index - 1
        } else {
            $endIdx = $cells.Count - 1
        }

        $fileName = $cfg.sections[$secNum]
        if ($fileName) {
            $secCells = @()
            for ($k = $startIdx; $k -le $endIdx; $k++) {
                $secCells += $cells[$k]
            }

            $outNb = [ordered]@{
                cells          = $secCells
                metadata       = $nb.metadata
                nbformat       = $nb.nbformat
                nbformat_minor = $nb.nbformat_minor
            }

            $outPath = Join-Path $lecturesDir $fileName
            $jsonStr = $outNb | ConvertTo-Json -Depth 100
            [System.IO.File]::WriteAllText($outPath, $jsonStr, [System.Text.Encoding]::UTF8)
            Write-Host "  Saved $fileName ($($secCells.Count) cells)"
        }
    }
}
Write-Host "SPLIT_COMPLETED_SUCCESSFULLY"
