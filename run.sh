#!/bin/bash

for cid in $(grep -v '^#' channels.list); do
  /app/DiscordChatExporter.Cli export -f Json --media -c ${cid}
done

exit 0
