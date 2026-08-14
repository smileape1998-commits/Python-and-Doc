$baseDir = "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2"

$configs = @(
    @{
        folder = "Module_03_Selection"
        lectureFile = "01_Lecture_Selection.ipynb"
        prefix = "3"
        sections = @{
            "3.1" = "3_1_Flowchart_If_Else.ipynb"
            "3.2" = "3_2_Relational_Operators.ipynb"
            "3.3" = "3_3_List_and_String_Comparison.ipynb"
            "3.4" = "3_4_Membership_Operator.ipynb"
            "3.5" = "3_5_If_Statement.ipynb"
            "3.6" = "3_6_If_Elif_Else.ipynb"
        }
    },
    @{
        folder = "Module_04_Repetition"
        lectureFile = "01_Lecture_Repetition.ipynb"
        prefix = "4"
        sections = @{
            "4.1" = "4_1_Flowchart_Loop.ipynb"
            "4.2" = "4_2_While_Loop.ipynb"
            "4.3" = "4_3_Bisection.ipynb"
            "4.4" = "4_4_For_Loop_Range.ipynb"
            "4.5" = "4_5_For_Loop_String.ipynb"
            "4.6" = "4_6_For_Loop_List.ipynb"
            "4.7" = "4_7_Break_Statement.ipynb"
        }
    }
)

foreach ($cfg in $configs) {
    $folderPath = Join-Path $baseDir $cfg.folder
    $lecturePath = Join-Path $folderPath $cfg.lectureFile
    $lecturesDir = Join-Path $folderPath "Lectures"

    # Remove existing files in Lectures dir first to clean up old unnamed/mynamed files like 4_2.ipynb
    if (Test-Path $lecturesDir) {
        Remove-Item -Path (Join-Path $lecturesDir "*") -Recurse -Force
    } else {
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
Write-Host "FIX_3_4_COMPLETED_SUCCESSFULLY"
