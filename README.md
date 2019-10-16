### Perf Test
Perf test for Intake service.

The test sends POST HTTP request to Intake with no time/rate limit.
Batch size is fixed to 100 jsons. 
There are two env vars to specify URL and API Key: `INTAKE_URL` and `INTAKE_KEY`. 

### Under the hood
Based on [Vegeta](https://github.com/tsenart/vegeta).

### Docker
Docker image is based on [peterevans/vegeta](https://hub.docker.com/r/peterevans/vegeta). 
 