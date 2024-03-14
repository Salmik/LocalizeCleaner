#!/bin/bash

rootFolder=.
deleteMode=false

if [[ $1 == "delete" ]]; then
  deleteMode=true
elif [[ $1 ]]; then
  rootFolder=$1
  if [[ $2 == "delete" ]]; then
    deleteMode=true
  fi
fi

allLocalisableFiles=$(find $rootFolder -type f -name "*.strings");
for localisableFile in $allLocalisableFiles; do
  echo -e "\n🔎  Inspecting:" $localisableFile

  while IFS=" = " read -r key value; do
    if [[ $key == \"* ]]; then
      searchKey=$(echo $key | sed 's/^"\(.*\)"$/\1/')
      if ! grep -rsq --include=\*.{swift,m,h} "\"$searchKey\"" $rootFolder; then
        echo "⚠️  $key is not used 💀"
        if [[ $deleteMode == true ]]; then
          pattern="^$key = $value$"
          sed -i "" "/$pattern/d" $localisableFile
          echo "🗑  Removing unused key: $key"
        fi
      fi
    fi
  done < $localisableFile
done
