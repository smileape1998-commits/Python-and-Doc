import json
import os
import re

base_dir = r"c:\Users\apiwi\Downloads\Python and Doc\Python and Doc\Python_Version 2"

modules_config = [
    {
        "folder": "Module_05_List_Processing",
        "lecture_file": "01_Lecture_List_Processing.ipynb",
        "mod_num": 5,
        "sections": {
            "5.1": "5_1_Basic_List_Operation.ipynb",
            "5.2": "5_2_List_Method.ipynb",
            "5.3": "5_3_Reading_Data_into_a_List.ipynb",
            "5.4": "5_4_Accessing_Elements_One_by_One.ipynb",
            "5.5": "5_5_Accessing_Consecutive_Elements.ipynb",
            "5.6": "5_6_List_Searching.ipynb",
            "5.7": "5_7_List_Sorting.ipynb",
            "5.8": "5_8_Split_and_Join.ipynb",
        }
    },
    {
        "folder": "Module_06_Function",
        "lecture_file": "01_Lecture_Function.ipynb",
        "mod_num": 6,
        "sections": {
            "6.1": "6_1_Function_Call.ipynb",
            "6.2": "6_2_Function_Definition.ipynb",
            "6.3": "6_3_List_Processing_Function.ipynb",
            "6.4": "6_4_Modifying_List_Parameter.ipynb",
            "6.5": "6_5_Common_Mistake.ipynb",
        }
    },
    {
        "folder": "Module_07_String_Processing",
        "lecture_file": "01_Lecture_String_Processing.ipynb",
        "mod_num": 7,
        "sections": {
            "7.1": "7_1_String_Index_and_Slice.ipynb",
            "7.2": "7_2_Escape_Char_and_String_Method.ipynb",
            "7.3": "7_3_More_String_Processing_Examples.ipynb",
            "7.4": "7_4_Reading_and_Writing_Files.ipynb",
        }
    },
    {
        "folder": "Module_08_Basic_Dict",
        "lecture_file": "01_Lecture_Basic_Dict.ipynb",
        "mod_num": 8,
        "sections": {
            "8.1": "8_1_Dict_Key_Value_Pairs.ipynb",
            "8.2": "8_2_Modifying_Dict_Content.ipynb",
            "8.3": "8_3_Looping_Through_Dict.ipynb",
            "8.4": "8_4_Checking_Key_Existence.ipynb",
        }
    }
]

for cfg in modules_config:
    folder_path = os.path.join(base_dir, cfg["folder"])
    lecture_path = os.path.join(folder_path, cfg["lecture_file"])
    lectures_dir = os.path.join(folder_path, "Lectures")
    
    os.makedirs(lectures_dir, exist_ok=True)
    
    with open(lecture_path, "r", encoding="utf-8") as f:
        nb_data = json.load(f)
    
    cells = nb_data.get("cells", [])
    metadata = nb_data.get("metadata", {})
    nbformat = nb_data.get("nbformat", 4)
    nbformat_minor = nb_data.get("nbformat_minor", 4)
    
    # Header cell (cell 0 if it's title `# Module X: ...`)
    module_header_cell = None
    if cells and cells[0].get("cell_type") == "markdown":
        src = "".join(cells[0].get("source", []))
        if src.strip().startswith("# Module"):
            module_header_cell = cells[0]
    
    # Identify section indices
    section_indices = []
    sec_pattern = re.compile(rf"^##\s*({cfg['mod_num']}\.\d+)")
    
    for idx, cell in enumerate(cells):
        if cell.get("cell_type") == "markdown":
            src = "".join(cell.get("source", []))
            for line in src.splitlines():
                m = sec_pattern.match(line.strip())
                if m:
                    sec_num = m.group(1)
                    section_indices.append((sec_num, idx))
                    break
    
    print(f"\nProcessing {cfg['folder']}...")
    print("Found sections:", section_indices)
    
    # Slice cells for each section
    for i, (sec_num, start_idx) in enumerate(section_indices):
        end_idx = section_indices[i + 1][1] if i + 1 < len(section_indices) else len(cells)
        sec_cells = cells[start_idx:end_idx]
        
        # If section has a mapping filename
        if sec_num in cfg["sections"]:
            out_filename = cfg["sections"][sec_num]
            out_path = os.path.join(lectures_dir, out_filename)
            
            # Combine module header cell (if desired) or start with section
            # Let's include section cells
            final_cells = sec_cells
            
            out_nb = {
                "cells": final_cells,
                "metadata": metadata,
                "nbformat": nbformat,
                "nbformat_minor": nbformat_minor
            }
            
            with open(out_path, "w", encoding="utf-8") as out_f:
                json.dump(out_nb, out_f, ensure_ascii=False, indent=1)
            print(f" Saved {out_filename} (cells {start_idx} to {end_idx-1})")
        else:
            print(f" Warning: Unmapped section {sec_num}")

print("\nDone splitting notebooks!")
