#!/bin/bash
set -e

echo "🚀 Running dbt command: $@"

# Install dependencies if packages.yml exists
if [ -f "packages.yml" ]; then
    echo "📦 Installing dbt packages..."
    dbt deps
fi

# Execute dbt command
exec dbt "$@"