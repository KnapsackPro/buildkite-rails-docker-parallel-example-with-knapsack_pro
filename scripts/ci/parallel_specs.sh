#!/bin/bash

set -euo pipefail

rake db:reset

rake knapsack_pro:queue:rspec
