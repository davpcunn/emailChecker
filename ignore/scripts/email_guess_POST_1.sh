#!/bin/bash
#json post

curl -H "Content-Type: application/json" -X POST -d '{"employee":"David Cunningham","company":"preferral"}' http://localhost:4567/api/guess.json