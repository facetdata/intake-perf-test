#!/bin/sh

EVENTS_FILE="events.json"

# Generating a batch of events
BATCH_SIZE=${BATCH_SIZE:-100}
echo "Generating a batch size $BATCH_SIZE"
for i in `seq 1 $BATCH_SIZE`
do
  echo '{"key":"value"}' >> $EVENTS_FILE
done

# Substitute key env vars and pass json config to Vegeta
QUERY_RATE=${QUERY_RATE:-0} # 0 = infinity
TEST_DURATION=${TEST_DURATION:-0} # 0 = forever
echo "Running a perf test"
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
vegeta attack -format=json -body $EVENTS_FILE | \
vegeta report
