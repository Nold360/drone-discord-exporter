#!/bin/bash
IFS=$'\n'

for cid in $(grep -v -E '^#|^$' channels.list); do
  /app/DiscordChatExporter.Cli export -f Json --media -o /cache -c ${cid}
done

for file in $(find /cache/*) ; do
  mv -v "${file}" /cache/$(basename "$file" | sed -e 's/[^A-Za-z0-9._-]/_/g')
done

exit 0
