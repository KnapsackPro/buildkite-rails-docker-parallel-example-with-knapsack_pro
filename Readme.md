# Buildkite Rails Docker Parallel Example with Knapsack Pro

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example of how to easily run a large number of parallel testing agents for a [Rails](https://rubyonrails.org/) application using [Buildkite](https://buildkite.com/), [Docker](https://www.docker.com) and [Knapsack Pro](https://knapsackpro.com?utm_source=github&utm_medium=readme&utm_campaign=buildkite-rails-docker-parallel-example-with-knapsack_pro). This approach works well with Docker available autoscaling environments like the [Buildkite AWS Stack](https://buildkite.com/buildkite/buildkite-aws-stack).

This repository doesn't actually include a Rails sample application, but has the same CI scripts, `Dockerfile` and `docker-compose.yml` you would use for a production application. For a non-Docker based setup, see the [Rails Parallel Example with Knapsack Pro](https://github.com/KnapsackPro/buildkite-rails-parallel-example-with-knapsack_pro).

Files to note:

* [docker-compose.yml](docker-compose.yml) - sets up the app to be able to run via [Buildkite’s Docker Compose support](https://buildkite.com/docs/guides/docker-containerized-builds)
* [Dockerfile](Dockerfile) - setups up the entire Ruby environment, including a waiter script to help wait for Posgtres, Redis and Memcache to become available
* [.buildkite/pipeline.yml](.buildkite/pipeline.yml) - the pipeline config showing how to have parallel steps
* [scripts/ci/parallel_specs.sh](scripts/ci/parallel_specs.sh) - runs the specs in parallel using [knapsack_pro gem](https://github.com/KnapsackPro/knapsack_pro-ruby) with Queue Mode. Tests are dynamically distributed across parallel jobs. Please read this article to learn more about [environment variables configuration for Buildkite and Knapsack Pro](http://docs.knapsackpro.com/2017/auto-balancing-7-hours-tests-between-100-parallel-jobs-on-ci-buildkite-example).

## How does it work?

In the [pipeline configuration file](.buildkite/pipeline.yml) the `parallelism` property for the test step is set to 20. When a build, the step will appear 20 times in the pipeline, each with different environment variables exposed so you can divvy up your test suite accordingly. You can set the parallelism as high as you need to bring down your build times.

See the [parallelizing builds guide](https://buildkite.com/docs/guides/parallelizing-builds) for more information to create parallelized and distributed builds with Buildkite.

See the [Containerized Builds with Docker guide](https://buildkite.com/docs/guides/docker-containerized-builds) for information on how to use Docker Compose with Buildkite pipelines.

Consult the [Knapsack Pro documentation](https://github.com/KnapsackPro/knapsack_pro-ruby) for configuring your database and dependent services to support running parallel steps on the one machine.

You can [obtain API key for Knapsack Pro here](https://knapsackpro.com?utm_source=github&utm_medium=readme&utm_campaign=buildkite-rails-docker-parallel-example-with-knapsack_pro).

## License

See [Licence.md](Licence.md) (MIT)
