# Buildkite Rails Docker Parallel Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example on how to easily run 20 parallel testing agents for a [Rails](https://rubyonrails.org/) application using [Buildkite](https://buildkite.com/), [Docker](https://www.docker.com) and [Knapsack](https://github.com/ArturT/knapsack).

This repository doesn't actually include a Rails sample application, but has the same CI scripts, Dockerfile and docker-compose you would use for a production application.

For a non-Docker based setup, see the [Rails Parallel Example](https://github.com/buildkite/rails-parallel-example).

Files to note:

* [docker-compose.yml](docker-compose.yml) - sets up the app to be able to run via [Buildkite’s Docker Compose support](https://buildkite.com/docs/guides/docker-containerized-builds)
* [Dockerfile](Dockerfile) - setups up the entire Ruby environment, including a waiter script to help wait for Posgtres, Redis and Memcache to become available
* [.buildkite/pipeline.yml](.buildkite/pipeline.yml) - the pipeline config showing how to have parallel steps
* [scripts/ci/parallel_specs.sh](scripts/ci/parallel_specs.sh) - runs the specs in parallel using Knapsack

## How does it work?

In the [pipeline configuration file](.buildkite/pipeline.yml) the `parallelism` property for the test step is set to 20. When a build, the step will appear 20 times in the pipeline, each with different environment variables exposed so you can divvy up your test suite accordingly. You can then run 20 agents (on the same machine, or distributed) to work on the 20 jobs in parallel.

See the [parallelizing builds guide](https://buildkite.com/docs/guides/parallelizing-builds) for more information to create parallelized and distributed builds with Buildkite.

See the [Containerized Builds with Docker guide](https://buildkite.com/docs/guides/docker-containerized-builds) for information on how to use Docker Compose with Buildkite pipelines.

Consult the [Knapsack documentation](https://github.com/ArturT/knapsack) for configuring your database and dependent services to support running parallel steps on the one machine.

## License

See [Licence.md](Licence.md) (MIT)
