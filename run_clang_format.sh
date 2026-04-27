#!/usr/bin/env bash

find . \( -iname "*.h" -o -iname "*.cpp" -o -iname "*.c" \) -print0 | while IFS= read -r -d '' file; do
    uncrustify -c uncrustify.cfg --no-backup -f "$file" -o "$file" && \
    clang-format -i "$file"
done