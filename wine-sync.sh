#!/bin/bash
# Wine Collection Sync Script
# Syncs the latest InVintory CSV export to the wine dashboard

cd "$(dirname "$0")/sync" || exit 1
python3 wine_sync.py

if [ $? -eq 0 ]; then
  echo ""
  echo "Pushing to GitHub..."
  cd ..
  git add index.html
  git commit -m "Sync wine collection from InVintory"
  git push origin main
  echo "✓ Dashboard updated"
else
  echo "✗ Sync failed"
  exit 1
fi
