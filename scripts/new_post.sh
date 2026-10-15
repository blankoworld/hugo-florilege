#!/bin/sh
# Create the next numbered quote in content/posts/.
# Run from your site's root directory (not from inside the theme):
#   ./themes/florilege/scripts/new_post.sh

set -e

POSTS_DIR="content/posts"

if [ ! -d "$POSTS_DIR" ]; then
  echo "Error: $POSTS_DIR not found. Run this script from your site's root directory." >&2
  exit 1
fi

max=0
for f in "$POSTS_DIR"/*.md; do
  base=$(basename "$f" .md)
  case "$base" in
    ''|*[!0-9]*) continue ;;
  esac
  if [ "$base" -gt "$max" ]; then
    max=$base
  fi
done

next=$((max + 1))

hugo new "content/posts/${next}.md"
