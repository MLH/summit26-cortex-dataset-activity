# Snowflake Summit 2026 — Cortex Dataset Activity

A base repository containing scripts and example datasets for the **Cortex Dataset Activity** at Snowflake Summit 2026.

## Overview

This activity walks participants through loading and analyzing datasets using [Snowflake Cortex](https://docs.snowflake.com/en/guides-overview-ai-features), Snowflake's suite of AI and ML features. This repo provides everything needed to set up, run, and reset the environment for the activity.

## Repository Structure

```
├── cleanup.sql           # Resets the Snowflake environment between uses
└── example_dataset/
    └── 311data.csv       # Example dataset for the activity
```

## Getting Started

### Prerequisites

- A Snowflake account with access to the `SNOWFLAKE_LEARNING_DB` database
- Appropriate privileges to create and drop tables and semantic views

### Setup with Example Dataset

1. Clone this repository or download the example CSV:
   ```bash
   git clone https://github.com/your-org/summit26-cortex-dataset-activity.git
   ```
2. Load the example dataset from `example_dataset/311data.csv` into your Snowflake environment.
3. Follow the activity instructions provided at the event.

## Cleanup

To reset the Snowflake environment between uses (e.g., between groups of participants), run the cleanup script:

```sql
-- In a Snowflake worksheet, execute:
EXECUTE IMMEDIATE FROM @your_stage/cleanup.sql;
```

Or paste the contents of `cleanup.sql` directly into a Snowflake worksheet and run it.

The script will:
- Drop all **semantic views** in `SNOWFLAKE_LEARNING_DB`
- Drop all **tables** in `SNOWFLAKE_LEARNING_DB`
- Print a confirmation message when complete

> **Note:** The cleanup script targets `SNOWFLAKE_LEARNING_DB`. Make sure this database exists and that you are using the correct role before running it.

## License

This project is licensed under the terms found in the [LICENSE](LICENSE) file.
