# Welcome to your new dbt project!

## 🚀 Using the starter project

Try running the following commands:

```bash
dbt run
dbt test
```

---

## 📚 Resources

* Learn more about dbt in the [official docs](https://docs.getdbt.com/docs/introduction)
* Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
* Join the [Slack community](https://community.getdbt.com/) for live discussions and support
* Find [dbt events](https://events.getdbt.com) near you
* Check out the [dbt blog](https://blog.getdbt.com/) for latest news and best practices

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

## ▶️ Typical workflow

```bash
cd analytics
set -a
source .env
set +a
dbt run --target dev
```
