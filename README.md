### Perf Test
Perf test for Intake service.

The test sends HTTP POST request to Intake.
Batch size is fixed to 100 jsons.
 
You may control the process using the following env vars: 
+ `INTAKE_URL` - Intake endpoint
+ `INTAKE_KEY` - API key
+ `QUERY_RATE` - the request rate per time unit (e.g. 100, 100/s, 100/m), 0 - no limit
+ `TEST_DURATION` - amount of time to issue request (e.g. 1s, 5s, 100s), 0 - no limit

### Under the hood
Based on [Vegeta](https://github.com/tsenart/vegeta).

### Docker
Docker image is based on [peterevans/vegeta](https://hub.docker.com/r/peterevans/vegeta). 
 