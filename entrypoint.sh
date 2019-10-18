#!/bin/sh

# Substitute key env vars and pass json config to Vegeta
jq -ncM \
--arg intake_url $INTAKE_URL \
--arg intake_key $INTAKE_KEY \
--arg query_rate $QUERY_RATE \
--arg test_duration $TEST_DURATION \
'{
  method: "POST",
  url: $intake_url,
  rate: $query_rate,
  duration: $test_duration,
  header: {Authorization: ["Basic " + ($intake_key | @base64)]}
}' | \
vegeta attack -format=json -body events.json | \
vegeta report
