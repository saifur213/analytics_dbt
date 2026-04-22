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

👉 Run this in terminal inside your dbt project:

```bash
set -a
source .env
set +a
```

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
