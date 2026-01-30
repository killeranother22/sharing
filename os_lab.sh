#!/bin/bash

############################################################
# Q1: Calculate volume of cylinder
############################################################

read -p "Enter radius: " r
read -p "Enter height: " h
echo "Volume of cylinder:"
echo "scale=2; 3.14*$r*$r*$h" | bc


############################################################
# Q2: Check write permission for all files in folder,
# add permission if missing and print line count
############################################################

read -p "Enter folder name: " dir

for file in "$dir"/*; do
  if [ ! -w "$file" ]; then
    chmod +w "$file"
  fi
  wc -l "$file"
done


############################################################
# Q3: Switch case:
# 1) Display employees with salary > 1000
# 2) Convert employee names to uppercase
############################################################

read -p "Enter employee file: " empfile
read -p "Enter choice (1 or 2): " ch

case $ch in
1)
while read name sal; do
  if [ "$sal" -gt 1000 ]; then
    echo "$name $sal"
  fi
done < "$empfile"
;;

2)
while read name sal; do
  echo "$(echo "$name" | tr 'a-z' 'A-Z') $sal"
done < "$empfile"
;;
esac


############################################################
# Q4: Read n subject marks, calculate average and grade
############################################################

read -p "Enter number of subjects: " n
sum=0

for ((i=1;i<=n;i++)); do
  read -p "Enter mark: " m
  sum=$((sum+m))
done

avg=$((sum/n))
echo "Average = $avg"

if [ $avg -ge 80 ]; then
  echo "Grade A"
elif [ $avg -ge 60 ]; then
  echo "Grade B"
else
  echo "Grade C"
fi


############################################################
# Q5: File exists → display → reverse sort → display again
############################################################

read -p "Enter filename: " f

if [ -f "$f" ]; then
  echo "File Content:"
  cat "$f"
  echo "Reverse Sorted Output:"
  sort -r "$f"
else
  echo "File not found"
fi


############################################################
# Q6: Replace /* with # on even numbered lines only
# Save output to new file with different extension
############################################################

read -p "Enter file name: " fname

if [ ! -f "$fname" ]; then
  echo "File not found"
else
  sed '2~2 s%^/\*%#%' "$fname" > "${fname%.txt}.out"
  echo "Saved to new file"
fi


############################################################
# Q7: Accept 5 numbers → even numbers avg → status print
############################################################

sum=0
count=0

for i in {1..5}; do
  read -p "Enter number: " num
  if (( num % 2 == 0 )); then
    sum=$((sum+num))
    count=$((count+1))
  fi
done

avg=$((sum/count))
echo "Average = $avg"

if [ $avg -ge 80 ]; then
  echo "NORMAL"
elif [ $avg -ge 65 ]; then
  echo "WARNING"
else
  echo "CRITICAL"
fi


############################################################
# Q8: Check execute permission and add if missing
############################################################

read -p "Enter file: " exe

if [ ! -x "$exe" ]; then
  chmod +x "$exe"
fi

ls -l "$exe"


############################################################
# Q9: Switch case: Student file
# 1) Display students above S and average
# 2) Convert file to lowercase
############################################################

read -p "Enter student file: " sf
read -p "Enter S value: " S
read -p "Choice (1 or 2): " c

case $c in
1)
sum=0
count=0
while read name mark; do
  if [ "$mark" -gt "$S" ]; then
    echo "$name $mark"
    sum=$((sum+mark))
    count=$((count+1))
  fi
done < "$sf"

avg=$((sum/count))
echo "Average = $avg"
;;

2)
tr 'A-Z' 'a-z' < "$sf"
;;
esac


############################################################
# Q10: Cylinder or Sphere Volume (Switch case)
############################################################

read -p "1-Cylinder 2-Sphere: " opt

case $opt in
1)
read -p "Radius: " r
read -p "Height: " h
echo "scale=2; 3.14*$r*$r*$h" | bc
;;

2)
read -p "Radius: " r
echo "scale=2; (4/3)*3.14*$r*$r*$r" | bc
;;
esac
