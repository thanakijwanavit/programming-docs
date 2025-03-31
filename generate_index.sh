#!/bin/bash

# Create or overwrite index.md
echo "# Documentation Index" > index.md
echo "" >> index.md
echo "## List of Markdown Files" >> index.md

# Find all .md files except index.md and generate links
find . -type f -name "*.md" ! -name "index.md" | while IFS= read -r file; do
    # Get filename without extension
    title=$(basename "$file" .md)
    # Get relative path
    path="${file#./}"
    # Write markdown link
    echo "- [${title}](${path})" >> index.md
done

echo "" >> index.md
echo "*Automatically generated index*" >> index.md
