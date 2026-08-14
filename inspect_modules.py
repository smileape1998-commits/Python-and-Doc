import json
import glob
import os

base = r"c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2"

modules = [
    "Module_01_DataType_and_Expression",
    "Module_02_Basic_String_and_List",
    "Module_03_Selection",
    "Module_04_Repetition",
    "Module_05_List_Processing",
    "Module_06_Function",
    "Module_07_String_Processing",
    "Module_08_Basic_Dict",
]

for m in modules:
    print(f"\n==================== {m} ====================")
    lec_dir = os.path.join(base, m, "Lectures")
    if os.path.exists(lec_dir):
        existing = os.listdir(lec_dir)
        print("Existing in Lectures:", existing)
    
    # main lecture file
    nb_files = glob.glob(os.path.join(base, m, "01_Lecture_*.ipynb"))
    if not nb_files:
        continue
    nb_path = nb_files[0]
    print("Main notebook:", os.path.basename(nb_path))
    with open(nb_path, "r", encoding="utf-8") as f:
        nb = json.load(f)
    
    for i, cell in enumerate(nb.get("cells", [])):
        if cell.get("cell_type") == "markdown":
            src = "".join(cell.get("source", []))
            for line in src.splitlines():
                if line.startswith("#"):
                    print(f"  Cell {i:2d}: {line}")
