import json

path = r"c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_05_List_Processing\01_Lecture_List_Processing.ipynb"

with open(path, "r", encoding="utf-8") as f:
    data = f.read()

# Replace literal "`n" strings with proper "\n"
cleaned_data = data.replace("`n", "\n").replace("\u0007", "a")

nb = json.loads(cleaned_data)

with open(path, "w", encoding="utf-8") as f:
    json.dump(nb, f, ensure_ascii=False, indent=1)

print("CLEANED STRAY CHARACTERS SUCCESSFULLY!")
