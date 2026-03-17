#  Consumer Product Sales And Business Analytics | SQL (PostgreSQL)

##  Overview

This project delivers a structured **Sales And Inventory Analysis** using SQL in PostgreSQL, with a focus on extracting actionable insights that inform **Pricing Strategy, Revenue Optimization and Inventory Efficiency**.

The analysis is designed to reflect real-world analytical workflows used in data-driven organizations—transforming raw transactional data into clear, decision-oriented outputs.

---

##  Scope of Analysis

* Revenue performance across product categories and individual SKUs
* Pricing and discount strategy evaluation
* Inventory utilization and stock risk identification
* Product-level and category-level performance benchmarking
* Detection of inefficiencies in sales and discounting

---

##  Dataset

The dataset consists of product-level transactional and inventory attributes:

| Column Name              | Description             |
| ------------------------ | ----------------------- |
| `category`               | Product category        |
| `name`                   | Product identifier      |
| `mrp`                    | Maximum Retail Price    |
| `discountPercent`        | Applied discount (%)    |
| `availableQuantity`      | Current inventory level |
| `discountedSellingPrice` | Final selling price     |
| `weightInGms`            | Product weight          |
| `outOfStock`             | Stock availability flag |
| `quantity`               | Units sold              |

---

##  Methodology

### Data Exploration & Validation

* Initial dataset inspection and schema understanding
* Validation of derived pricing fields (discount vs final price consistency)
* Identification of distribution patterns across categories and pricing

### Tools used

* PostgreSQL for querying and analysis
* VS Code for writing and structuring SQL

### SQL Techniques Applied

* Aggregations (`SUM`, `AVG`, `MIN`, `MAX`)
* Grouped analysis (`GROUP BY`)
* Derived metrics and calculations
* Common Table Expressions (CTEs) for modular query design
* Multi-level sorting for prioritization and insight extraction

---

##  Key Metrics

* **Revenue** = `discountedSellingPrice × quantity`
* **Discount Impact** = `(mrp - discountedSellingPrice) × quantity`
* **Inventory Volume** = `SUM(availableQuantity)`
* **Sales Volume** = `SUM(quantity)`

---

##  Analytical Highlights

* Higher discounts don’t always translate into higher sales. In some cases, products are heavily discounted but still don’t sell well.
* There are categories with a lot of inventory but relatively low sales, which points to inefficient stock allocation.
* A few products contribute disproportionately to revenue — not necessarily because they sell more, but because they are priced higher.
* Discounting is clearly impacting potential revenue, and in some cases it may be more aggressive than necessary.

---

##  Project Structure

```
sales_analysis/
│
├── data/
│   └── zepto_v2.csv
│
├── sql/
│   ├── 01_create_table.sql
│   ├── 02_load_data.sql
│   ├── 03_data_cleaning.sql
│   ├── 04_data_exploration.sql
│   ├── 05_data_analysis.sql
│
├── README.md
```
## Remarks

### This project demonstrates a structured approach to analytical problem-solving using SQL, with emphasis on:
* Translating business questions into data queries
* Building clear, maintainable analytical workflows
* Generating insights that directly support decision-making