$oldFiles = @(
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_03_Selection\Lectures\3_2_Comparison_Operators.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_03_Selection\Lectures\3_3_If_Elif_Else.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_03_Selection\Lectures\3_4_Members.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_03_Selection\Lectures\3_5.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_03_Selection\Lectures\3_6.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\Lectures\4_2.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\Lectures\4_3.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\Lectures\4_4.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\Lectures\4_5.ipynb",
    "c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_04_Repetition\Lectures\4_6.ipynb"
)

foreach ($f in $oldFiles) {
    if (Test-Path $f) {
        try {
            Remove-Item -Path $f -Force -ErrorAction Stop
            Write-Host "Removed $f"
        } catch {
            Write-Host "Failed to remove $f : $_"
        }
    }
}
