#!/bin/bash
set -e

# Build chdman
make chdman

# Create a dummy bin file (1MB of zeros)
dd if=/dev/zero of=test.bin bs=1024 count=1024 2>/dev/null

# Create a cue file for the bin
cat <<EOF > test.cue
FILE "test.bin" BINARY
  TRACK 01 MODE1/2048
    INDEX 01 00:00:00
EOF

# Convert to CHD
./chdman createcd -i test.cue -o test.chd --force

# Verify existence
if [ ! -f test.chd ]; then
    echo "Error: test.chd was not created"
    exit 1
fi

# Calculate SHA256 sum
ACTUAL=$(sha256sum test.chd | awk '{print $1}')
EXPECTED="5436e2aa76361b7f6b5e494c2ea40e7ffd5672e40d9f25fe67d8c9ed4c13f35b"

# Compare
if [ "$ACTUAL" != "$EXPECTED" ]; then
    echo "Error: SHA256 mismatch"
    echo "Expected: $EXPECTED"
    echo "Actual:   $ACTUAL"
    rm test.bin test.cue test.chd
    exit 1
fi

# Clean up
rm test.bin test.cue test.chd
echo "Test completed successfully"
