#!/bin/sh

# Substitute Intake URL and API key and pass json config to Vegeta
jq -ncM --arg intake_url $INTAKE_URL --arg intake_key $INTAKE_KEY \
'{method: "POST", url: $intake_url, header: {Authorization: ["Basic " + ($intake_key | @base64)]}}' | \
vegeta attack -format=json -body events.json | vegeta report
