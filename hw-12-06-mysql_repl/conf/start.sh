#!/bin/bash
current_dir=$(dirname "${BASH_SOURCE[0]}")
cd "$current_dir"
docker compose stop
docker compose rm -vf
docker compose up -d
