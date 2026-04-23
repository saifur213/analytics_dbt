# Welcome to your new dbt project!

## 🚀 Using the starter project

Try running the following commands:

```bash
dbt run
dbt test
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

👉 Create snoflake db and initalze db with production like data:

👉 FREE dataset: https://github.com/sleekdata/oms-db-setup

This ensures all environment variables are loaded before executing dbt commands.

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
