#!/bin/bash

if [ "$#" -gt 2 ]; then
    echo "Print an HTML file to PDF via headless Chrome"
    echo "Usage: $0 [input_html [output_pdf]]"
    echo "Default to stdin and stdout if filenames not specified"
    exit 1
fi

input_html=${1:-/dev/stdin}
output_pdf=${2:-/dev/stdout}

TEMP_FILE=$(mktemp /tmp/chrome-$USER.XXXXXXX.html)
cat "$input_html" > "$TEMP_FILE"

docker run --rm \
    -v /tmp:/tmp:Z \
    -v /usr/share/fonts:/usr/share/fonts \
    -v /usr/share/fontconfig:/usr/share/fontconfig \
    asia.gcr.io/zenika-hub/alpine-chrome \
    --no-sandbox \
    --headless \
    --disable-gpu \
    --run-all-compositor-stages-before-draw \
    --virtual-time-budget=5000 \
    --no-margins \
    --no-pdf-header-footer \
    --print-to-pdf-no-header \
    --print-to-pdf="$TEMP_FILE.pdf" "$TEMP_FILE"

cat "$TEMP_FILE.pdf" > "$output_pdf"
rm "$TEMP_FILE" "$TEMP_FILE.pdf"
