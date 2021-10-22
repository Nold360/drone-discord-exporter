#!/bin/bash
IFS=$'\n'

for cid in $(grep -v -E '^#|^$' channels.list); do
  /app/DiscordChatExporter.Cli export -f Json --media -c ${cid} --after 901051269223968778 -o /cache
done

for file in $(find /cache/*) ; do
  mv -v "${file}" /cache/$(basename "$file" | sed -e 's/[^A-Za-z0-9._-]/_/g')
done

exit 0
