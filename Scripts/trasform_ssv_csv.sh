#!/bin/bash

# Target your file directly
INPUT_FILE="Teste.ssv"

# Check if the file actually exists before running
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: $INPUT_FILE not found in the current directory!"
    exit 1
fi

awk '
BEGIN {
    # Print clean, standardized CSV headers
    print "\"Year\",\"Gender\",\"Age at diagnosis\",\"ICD10 code\",\"Site description\",\"Count\""
}
{
    # Skip the original file header if encountered
    if ($0 ~ /^Year/) next;
    
    # Clean up formatting: change any stray commas to spaces, trim ends, normalize spaces
    gsub(/,/, " ");
    sub(/^ +/, "");
    sub(/ +$/, "");
    gsub(/[ \t]+/, " ");
    
    # Skip empty lines
    if (length($0) == 0) next;
    
    # 1. Extract Year
    year = $1;
    
    # 2. Extract Gender (handles: Female, Male, All ages groups)
    if ($2 == "Female") {
        gender = "Female";
        i = 3;
    } else if ($2 == "Male") {
        gender = "Male";
        i = 3;
    } else if ($2 == "All" && $3 == "ages" && $4 == "groups") {
        gender = "All ages groups";
        i = 5;
    } else {
        gender = $2;
        i = 3;
    }
    
    # 3. Extract Age at diagnosis (handles: "0 (Under 1)", "XX to YY", "90 and over", "All ages")
    if ($i == "0" && $(i+1) == "(Under" && $(i+2) == "1)") {
        age = "0 (Under 1)";
        i += 3;
    } else if ($(i+1) == "to") {
        age = $i " to " $(i+2);
        i += 3;
    } else if ($i == "90" && $(i+1) == "and" && $(i+2) == "over") {
        age = "90 and over";
        i += 3;
    } else if ($i == "All" && $(i+1) == "ages") {
        age = "All ages";
        i += 2;
    } else {
        age = $i;
        i += 1;
    }
    
    # 4. Extract ICD10 Code (handles ranges like C00-C97 and exclusions like "excl. C44")
    if ($(i+1) == "excl.") {
        code = $i " " $(i+1) " " $(i+2);
        i += 3;
    } else if ($(i+1) ~ /^[CD][0-9]/) {
        code = $i " " $(i+1);
        i += 2;
    } else {
        code = $i;
        i += 1;
    }
    
    # 5. Determine where the Count and Site Description end
    # (Accounts for optional labels like "Age-gender-standardised" at the end of rows)
    if ($NF ~ /^[0-9]+$/) {
        count = $NF;
        end_desc = NF - 1;
    } else {
        count = $(NF-1);
        end_desc = NF - 2;
    }
    
    # 6. Reassemble the remaining words into the Site Description
    desc = "";
    for (j = i; j <= end_desc; j++) {
        if (j > i) desc = desc " ";
        desc = desc $j;
    }
    
    # Output perfectly formatted CSV row enclosed in quotes
    printf "\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"\n", year, gender, age, code, desc, count;
}' "$INPUT_FILE"
