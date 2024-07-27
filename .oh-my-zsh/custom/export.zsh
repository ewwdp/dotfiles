
script_dir=$(dirname "$0")
if [ -d "$script_dir/exports" ]; then
  for file in "$script_dir/exports"/*.zsh; do
    if [ -f "$file" ]; then
      source "$file"
    fi
  done
else
  echo "Directory '$script_dir/exports' does not exist."
fi
