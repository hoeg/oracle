#!/bin/bash

REPOS=()
while IFS= read -r line || [[ -n "$line" ]]; do
    REPOS+=("$line")
done < "repos.txt"

IGNORED_REPOS=()
while IFS= read -r line || [[ -n "$line" ]]; do
    IGNORED_REPOS+=("$line")
done < "repos.ignored"

echo "Start asking"

for repo in "${REPOS[@]}"; do
    if [[ " ${IGNORED_REPOS[@]} " =~ " $repo " ]]; then
        echo "Skipping $repo (listed in repos.ignored)"
    else
        echo "Checking out $repo"
        git clone "https://github.com/$repo.git"
        echo "clone $repo"

        repo_name=$(echo "$repo" | cut -d'/' -f2)
        echo "ask about $repo_name"
        semgrep scan --config questions/ $repo_name
    fi
done