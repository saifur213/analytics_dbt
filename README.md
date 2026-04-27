# Welcome to dbt + snowflake project!

## ▶️ Project Setup Guide

👉 Clone the git repo:

```bash
git clone https://github.com/saifur213/analytics_dbt.git
```
👉 Create virtual environment

```bash
python -m venv .venv
```

👉 Install dependency:

```bash
pip install -r requirements.txt
```
👉 Create .env and profiles.yml:

```bash
cp .env.example .env
cp profiles.example.yml profiles.yml
```

👉 Run the following command before push in feature branch:

```bash
sqlfluff lint models
sqlfluff fix models
```

---

## ⚙️ Environment Setup (Required before running dbt)

👉 Create .env with the following variables:
```bash
SNOWFLAKE_ACCOUNT="<>"
SNOWFLAKE_USER="<>"
SNOWFLAKE_PRIVATE_KEY_PATH=$HOME/keys/rsa_key.p8
```

👉 Run this in terminal inside your dbt project:

```bash
set -a
source .env
set +a
```

👉 Create snowflake db and initalze db with production like data:

👉 FREE dataset: https://github.com/sleekdata/oms-db-setup

This ensures all environment variables are loaded before executing dbt commands.

---

## 🚀 Using the starter project

Try running the following commands:

```bash
dbt run
dbt test
dbt debug
dbt compile
dbt build
```

## 🚀 Run the project on docker

Try running the following commands:

```bash
docker-compose build
docker-compose run --rm dbt debug
docker-compose run --rm dbt run --target dev
docker-compose run --rm dbt build --target ci
```

---

## ▶️ Deployment Instructions in Snowflake

1. Create a git workspace in snoflake

2. Create API Integration in Snowflake

```bash
CREATE OR REPLACE API INTEGRATION git_api_integration
API_PROVIDER = git_https_api
API_ALLOWED_PREFIXES = ('git_url')
API_USER_AUTHENTICATION = (TYPE = '')
ENABLED = TRUE;
```

3. Test

4. Deply
