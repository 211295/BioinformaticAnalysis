#!/bin/bash

INPUT_FILE="Teste2.csv"

# Check if the file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: $INPUT_FILE not found!"
    exit 1
fi

awk '
BEGIN {
    # Print a clean, simple CSV header
    print "Year,Gender,Age at diagnosis,ICD10 code,Site description,Count"
}
{
    # Skip original file headers if they repeat
    if ($1 == "Year") next;
    if (NF < 4) next; # Skip empty lines

    # 1. YEAR (Field 1)
    year = $1

    # 2. GENDER (Field 2 or multi-word)
    if ($2 == "All" && $3 == "ages" && $4 == "groups") {
        gender = "All ages groups"
        idx = 5
    } else {
        gender = $2
        idx = 3
    }

    # 3. AGE AT DIAGNOSIS
    if ($idx == "0" && $(idx+1) == "(Under" && $(idx+2) == "1)") {
        age = "0 (Under 1)"
        idx += 3
    } else if ($(idx+1) == "to") {
        age = $idx " to " $(idx+2)
        idx += 3
    } else if ($idx == "90" && $(idx+1) == "and" && $(idx+2) == "over") {
        age = "90 and over"
        idx += 3
    } else if ($idx == "All" && $(idx+1) == "ages") {
        age = "All ages"
        idx += 2
    } else {
        age = $idx
        idx += 1
    }

    # 4. ICD10 CODE
    if ($(idx+1) == "excl.") {
        code = $idx " " $(idx+1) " " $(idx+2)
        idx += 3
    } else {
        code = $idx
        idx += 1
    }

    # 5. COUNT (Look from the very end of the line, ignoring labels)
    if ($NF ~ /^[0-9]+$/) {
        count = $NF
        end_idx = NF - 1
    } else {
        count = $(NF-1)
        end_idx = NF - 2
    }

    # 6. SITE DESCRIPTION (Everything remaining in the middle)
    desc = ""
    for (i = idx; i <= end_idx; i++) {
        desc = (desc == "" ? $i : desc " " $i)
    }
    # Remove any original stray commas from inside the description text itself
    gsub(/,/, "", desc);

    # Print with clean commas, wrapping ONLY the middle text description in quotes
    printf "%s,%s,%s,%s,\"%s\",%s\n", year, gender, age, code, desc, count
}' "$INPUT_FILE"
