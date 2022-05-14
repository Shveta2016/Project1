# E3 - Terraform

We want to exercise simple terraform module writing on an arbritary case of extracting values from log messages and offering this back as outputs. We're only interested in CRITICAL messages.

```
"2022-01-02 15:12:41 | INFO | Found Fragment: 192ry168x1 ----1",
"2022-01-02 15:13:41 | INFO | Found Fragment: 192 rt168x1 --x--2",
"2022-01-02 15:14:41 | ERROR | Found Fragment: 192yr t168p1 --y--3",
"2022-01-02 15:15:41 | INFO | Found Fragment: 192h wrz168 1 -z---2",
"2022-01-02 15:16:40 | CRITICAL | Suspicious Fragment: 192r txxs168x1 ---  -5",
"2022-01-02 15:16:41 | CRITICAL | Suspicious Fragment: 192 rt168xree1 - -z --5",
"2022-01-02 15:17:41 | INFO | Found Fragment: 192rt168x1 --- -1",
"2022-01-02 15:18:41 | CRITICAL | Suspicious Fragment: 192rxs t168xl kk1 --e- e   -7",
"2022-01-02 15:19:41 | INFO | Found Fragment: 192rt168bl ax1 ----     2"
```

We want to have two outputs: fragment_digits and fragment_ips that represents the numeric values of the critical log messages.

Example:

[["192", "168", "1", "5"],
["192", "168", "1", "7"]],

and

["192.168.1.5", "192.168.1.7"]

## Prep

* This uses terratest https://terratest.gruntwork.io/
* Golang

## Actions

* Implement `numeric-voodoo/voodoo.tf`
* Use best practises
* Validate your result by running `make test`
# E2 - CI/CD

Now that we have created a new design, development also wants to improve their way of releasing.
They are currently copying the sources into the public EC2 via SSH and running the build on the machine itself. Testing is currently done by accessing the backend API and going thru each and every route to validate functionality.

## Actions

* Recommend a design to automate the release process and ensure only working code is in fact released
# E1 - AWS

You're given a design of an [infrastructure setup](https://cdn.production.data.zndbx.com/assessment/E1_2022-02-11.png) where we're currently running a low traffic backend API and a RDBMS as a supportive system for the backend.

* We have plans to grow and must ensure if the existing platform will meet our needs in terms of scaling and robustness over the next 5 years
* With multiple teams getting onboarded we're expecting 200 API that must be served to customers at the same time
* Development asked how to handle development releases and how to reach a high uptime without disruptions
* Security is interested on how we could block scraping requests against our APIs
* The amount of manual intervention on keeping the stack itself running must be minimal

Backend API Criteria:
* Dockerized
* 24/7 Uptime
* Averages 20% CPU, 500MB RAM usage during lifetime
* Serves primarily JSON payloads
* Is frequently called from around the world
* Requires a RDBMS for storage which contains data to serve
** For simplicity expect that the RDBMS data is always provided and accurate

* Do not cost optimize

## Actions

* Evaluate the existing design and comment
* Recommend changes to accomodate the new requirements

## Notes

* Please use a tool for the architecture that can be presented online
