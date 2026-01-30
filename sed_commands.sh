#!/bin/bash

#############################################
# SED FEATURES DEMO SCRIPT
#############################################

read -p "Enter filename: " file

#############################################
# 1) Print entire file (default behavior)
#############################################

sed '' "$file"


#############################################
# 2) Print specific line (Line 3)
#############################################

# -n : suppress default printing
# p  : print command
sed -n '3p' "$file"


#############################################
# 3) Print range of lines (2 to 5)
#############################################

sed -n '2,5p' "$file"


#############################################
# 4) Delete a specific line (Line 2)
#############################################

sed '2d' "$file"


#############################################
# 5) Delete range of lines (3 to 6)
#############################################

sed '3,6d' "$file"


#############################################
# 6) Delete alternate (even) lines
#############################################

# n = move to next line
# d = delete current line
sed 'n;d' "$file"


#############################################
# 7) Search and replace (first occurrence only)
#############################################

# Replace "hello" with "hi"
sed 's/hello/hi/' "$file"


#############################################
# 8) Search and replace (all occurrences)
#############################################

# g = global replacement
sed 's/hello/hi/g' "$file"


#############################################
# 9) Replace only on specific line (Line 3)
#############################################

sed '3 s/apple/orange/' "$file"


#############################################
# 10) Replace at beginning of line
#############################################

# ^ = start of line
sed 's/^Linux/UNIX/' "$file"


#############################################
# 11) Replace at end of line
#############################################

# $ = end of line
sed 's/end$/stop/' "$file"


#############################################
# 12) Insert line BEFORE line 2
#############################################

# i = insert
sed '2i This is inserted line' "$file"


#############################################
# 13) Append line AFTER line 2
#############################################

# a = append
sed '2a This is appended line' "$file"


#############################################
# 14) In-place editing (MODIFIES FILE)
#############################################

# -i = edit original file
# Uncomment to use
# sed -i 's/test/TEST/g' "$file"


#############################################
# 15) Replace only if pattern is at line start
#############################################

# Replace /* with # only at beginning
sed 's%^/\*%#%' "$file"


#############################################
# 16) Even line replacement example
#############################################

# Replace "old" with "new" on even lines only
sed '2~2 s/old/new/' "$file"


#############################################
# END OF SCRIPT
#############################################
