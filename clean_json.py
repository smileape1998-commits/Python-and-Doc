import json

notebook_path = r"c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2\Module_05_List_Processing\01_Lecture_List_Processing.ipynb"

# Read file
with open(notebook_path, "r", encoding="utf-8") as f:
    content = f.read()

# Fix literal backtick n
content = content.replace("`n", "")
content = content.replace("\u0007", "a")

try:
    nb = json.loads(content)
    with open(notebook_path, "w", encoding="utf-8") as f:
        json.dump(nb, f, ensure_ascii=False, indent=1)
    print("VALID JSON CLEANED SUCCESSFULLY!")
except Exception as e:
    print("Error parsing JSON:", e)
