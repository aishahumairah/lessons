# Week 3: Python for Data Engineering

## Learning Objectives

By the end of this week, you will be able to:

- Write Python scripts using variables, control flow, and functions
- Read, write, and parse CSV and JSON files with Python
- Load and explore data with pandas
- Clean dirty data: fix whitespace, casing, types, missing values, and duplicates
- Handle errors gracefully with try/except
- Organise reusable code into functions and classes
- Build a simple end-to-end data cleaning pipeline

---

## Schedule

### Technical

| Day | Topic | File |
|-----|-------|------|
| 1 | Python Fundamentals | [lesson1_python_fundamentals.ipynb](lesson1_python_fundamentals.ipynb) |
| 2 | File Handling & Exception Handling | [lesson2_file_handling.ipynb](lesson2_file_handling.ipynb) |
| 2–3 | pandas Basics | [lesson3_pandas.ipynb](lesson3_pandas.ipynb) |
| 3–4 | Lab: Clean Multiple CSV Files | [labs/lab3_clean_csv_files.ipynb](labs/lab3_clean_csv_files.ipynb) |
| 4 | OOP & Modules | [lesson4_oop_modules.ipynb](lesson4_oop_modules.ipynb) |
| 5 | Python Exercises | [exercises/python_exercises.ipynb](exercises/python_exercises.ipynb) |

### Activities

| Activity | File |
|----------|------|
| Discussion + Reading Club + Project Review | [activities/week3_activities.ipynb](activities/week3_activities.ipynb) |

---

## The Dataset — Raw Sales Data

Three quarterly sales files, each with realistic data quality problems:

| File | Period | Rows | Key Issues |
|------|--------|------|------------|
| `data/raw/sales_q1.csv` | Jan–Mar 2023 | 26 (incl. 1 duplicate) | Mixed date formats, casing inconsistency, dollar signs in prices, missing values, negative quantity |
| `data/raw/sales_q2.csv` | Apr–Jun 2023 | 25 | Category typos, wrong totals, zero quantity, missing sales_rep |
| `data/raw/sales_q3.csv` | Jul–Sep 2023 | 25 | Quantity as floats, mixed date separators, extra whitespace in product names |

The lab and project combine these into one clean file at `data/clean/sales_2023.csv`.

---

## Prerequisites

- Weeks 1 & 2 complete
- Python 3 installed (verified in Week 1 Lesson 3)
- Jupyter available — run `jupyter notebook` in Git Bash to open

**Install pandas before starting** (run once in Git Bash or terminal):

```bash
pip install pandas
```

---

## Files in This Week

```
week3/
├── README.md
├── lesson1_python_fundamentals.ipynb   ← Variables, types, control flow, functions
├── lesson2_file_handling.ipynb         ← File I/O, csv module, JSON, exceptions, pathlib
├── lesson3_pandas.ipynb                ← DataFrames, read/explore/filter/clean/write
├── lesson4_oop_modules.ipynb           ← Imports, standard library, classes, modules
├── activities/
│   └── week3_activities.ipynb
├── data/
│   ├── raw/
│   │   ├── sales_q1.csv               ← Messy Q1 data (Jan–Mar 2023)
│   │   ├── sales_q2.csv               ← Messy Q2 data (Apr–Jun 2023)
│   │   └── sales_q3.csv               ← Messy Q3 data (Jul–Sep 2023)
│   └── clean/
│       └── sales_2023.csv             ← Created by the lab
├── exercises/
│   └── python_exercises.ipynb         ← 22 exercises across 5 sections
└── labs/
    └── lab3_clean_csv_files.ipynb      ← Step-by-step cleaning pipeline
```

---

## Project: Sales Data Cleaning Pipeline

**Goal:** Produce a single clean `sales_2023.csv` from three messy quarterly files.

**Cleaning requirements:**
1. Remove duplicate rows
2. Strip leading/trailing whitespace from all string columns
3. Standardise `category` to title case (Electronics, Clothing, Home & Kitchen)
4. Parse all dates to `YYYY-MM-DD` format
5. Remove currency symbols from `unit_price` and convert to float
6. Recalculate missing `total` values as `quantity * unit_price`
7. Drop rows where `quantity <= 0`
8. Fix category typos (`Electrnics` → `Electronics`, `Home & Kithen` → `Home & Kitchen`)
9. Convert `quantity` to integer

**Deliverable:** `data/clean/sales_2023.csv` — 73 rows, no nulls in key columns, consistent types.

Push your completed lab and exercises to GitHub before Week 4.
