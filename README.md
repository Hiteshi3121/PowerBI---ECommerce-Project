# Amazon E-Commerce Sales Analysis — Power BI Capstone Project

An end-to-end **Power BI e-commerce analytics project** focused on sales performance, customer segmentation, product performance, ratings, returns, delivery efficiency, and business opportunities.

> **Project type:** Power BI Capstone / Data Analytics  
> **Prepared by:** Hiteshi Aglawe  
> **Primary tool:** Microsoft Power BI

---

<img width="1900" height="1100" alt="image" src="https://github.com/user-attachments/assets/733970a9-9109-4be1-8801-03a3bcda81e8" />

<img width="1900" height="1100" alt="image" src="https://github.com/user-attachments/assets/f268737a-c659-41b9-bce5-ac0b7e8d29bf" />

<img width="1900" height="1100" alt="image" src="https://github.com/user-attachments/assets/405a84f8-8281-4a49-b55e-a12eb21f524b" />

<img width="1900" height="1100" alt="image" src="https://github.com/user-attachments/assets/cb5f2cd9-ac6d-44bc-a278-ee0bab96e3a4" />


## 📌 Project Overview

This project analyzes an e-commerce dataset to understand:

- What is driving revenue and sales growth?
- Which product categories and products contribute the most value?
- Who are the major customer segments?
- Where are operational problems visible in delivery, returns, and satisfaction?
- What data-backed actions can improve customer value and business performance?

The project combines **Power Query data preparation, Power BI data modelling, DAX measures, interactive dashboards, and SQL-based analytical extensions**.

---

## 🎯 Business Problem

The business wants to sustain sales performance while improving customer value and the overall shopping experience.

The analysis therefore focuses on three major questions:

1. **Revenue — What drives growth?**
2. **Customers — Who creates value?**
3. **Operations — What needs improvement?**

---

## 📊 Dataset Snapshot

| Metric | Value |
|---|---:|
| Orders | ~113K |
| Customers | ~113K |
| Unique Products | 44 |
| Product Categories | 5 |
| Total Revenue | ₹107.24M |
| Total Quantity | ~603K |
| Average Order Value | ₹949.09 |
| Average Rating | 2.73 / 5 |
| Average Delivery Time | 9.41 days |
| Returned Orders | ~31K |
| Return Rate | ~27% |
| Analysis Period | 2015–2020 |

> **Note:** This is an academic/project dataset used for analysis and dashboard development; it is not presented as live Amazon corporate data.

---

## 🧹 Data Preparation

Data cleaning and preparation were performed in **Power Query** before dashboard development.

Key preparation steps included:

- Handling missing and blank values.
- Removing irrelevant/blank rows where appropriate.
- Cleaning and trimming text fields.
- Standardizing data types for dates, numeric fields, and categorical columns.
- Handling return-reason blanks based on order status.
- Creating analytical fields such as **Delivery Days** and **Customer Category**.
- Validating duplicate identifiers and relationships between tables.
- Creating a distinct **Product** lookup with a Product ID for product-level analysis.

---

## 🧩 Data Model

The core model contains:

<img width="750" height="600" alt="image" src="https://github.com/user-attachments/assets/2d968e09-228f-440a-9399-276fc66f5ede" />


The dataset has an important characteristic: the **Orders–Customers relationship is 1:1**, with each customer appearing once in the order data. This means the current dataset represents first-time purchase activity rather than a repeat-purchase history.

---

## 🛠️ Tools & Technologies

**Power BI**
- Power Query
- Data modelling
- DAX
- Interactive slicers
- Field parameters
- Dashboard visualizations

**SQL Server / SSMS**
- SQL analysis
- Aggregations
- CTEs
- Window functions such as `LAG()`
- Customer scoring
- Growth analysis
- Rolling averages
- Conditional updates

**Supporting tools**
- Microsoft Excel
- PowerPoint
- Word

---

# 📈 Power BI Dashboards

## 1. Sales Analysis Dashboard

The executive sales view brings together revenue, orders, quantity, AOV, rating, delivery time, returns, yearly trends, customer categories, and product categories.

### Key questions answered
- How is revenue changing over time?
- Which product categories generate the most revenue?
- Which customer categories contribute the most value?
- How do order volumes vary by rating?

---

## 2. Product Analysis Dashboard

This page focuses on category, subcategory, product-level revenue, order volume, pricing, customer satisfaction, and delivery performance.

### Key questions answered
- Which product categories drive revenue?
- Which categories receive the most orders?
- How does average sale price vary by category?
- Which categories show stronger customer engagement?

---

## 3. Individual Product Analysis Dashboard

This page provides a deeper view of individual products using product selection, revenue trends, location contribution, ratings, shipping fees, and delivery metrics.

### Key questions answered
- How does a selected product perform over time?
- Where is product revenue concentrated?
- What are its average rating and shipping cost?
- How does the product compare across the overall portfolio?

---

# 🔎 Key Business Insights

### Revenue & Growth
- Revenue remained broadly stable around **₹16–17M from 2015 to 2019**.
- Revenue increased sharply to approximately **₹24M in 2020**, making 2020 the strongest growth year in the dataset.
- The increase was broad-based rather than being isolated to a single product category.

### Product Performance
- **Phones & Tablet (~₹39M)** and **Electronics (~₹33M)** are the strongest revenue contributors.
- Fashion, Health & Beauty, and Home & Office each contribute roughly **₹12M**.
- Some high-priced products show lower sales volume, creating opportunities for better product visibility, content, bundles, and selective promotions.

### Customer Segmentation
- **Bronze** is the largest customer segment at roughly **87K customers**.
- Gold and Platinum have much smaller customer populations but still contribute substantial revenue.
- The dataset supports spend-based customer segmentation, while repeat-purchase/RFM analysis requires future repeat-order history.

### Delivery & Operations
- **Express:** ~3.5 days
- **Standard:** ~10 days
- **Shipped from Abroad:** ~15 days
- Average delivery time is broadly similar across product categories, indicating that **delivery type** is the more important operational driver.

### Returns & Satisfaction
- Approximately **31K orders** are returned, or about **27%** of the dataset.
- Health & Beauty and Fashion have some of the highest return volumes.
- Return reasons are spread across quality/defect, missing items, wrong item, expectation mismatch, and description mismatch.
- The analysis suggests process improvements in listing quality, packing accuracy, product quality, and fulfilment are important areas to investigate.

### Regional Concentration
- **Greater Accra (~₹27M)** and **Ashanti (~₹23M)** are the leading revenue locations.
- Together, these two locations contribute roughly **47% of total revenue**.

---

# 💡 Strategic Recommendations

### Customer & Loyalty
- Use welcome-back incentives to encourage first-time buyers to place a second order.
- Protect high-value customer segments with stronger benefits and personalized offers.
- Move toward **RFM-style segmentation** once repeat-purchase history is available.

### Product Growth
- Improve product images, specifications, use-case content, visibility, and bundles for underperforming high-price products.
- Concentrate promotions around weaker sales periods rather than using blanket discounts.
- Use customer feedback to identify products that need quality or listing improvements.

### Operations
- Prioritize delivery-speed improvements for international/shipped-from-abroad orders.
- Strengthen listing QA, packing checks, and product quality controls in high-return categories.
- Track **return reason + delivery time + rating** together as an operational monitoring framework.

### Regional Focus
- Prioritize inventory, fulfilment capacity, and marketing tests in major revenue locations such as Greater Accra and Ashanti.
- Use smaller regions for localized demand-building experiments.

---

# 🧮 DAX & Analytics Examples

Example measures used in the project include:

```DAX
Total Revenue =
SUM(Orders[Sale Price])
```

```DAX
Unique Customers =
DISTINCTCOUNT(Orders[CustomerID])
```

```DAX
Return Rate % =
DIVIDE(
    CALCULATE(
        COUNTROWS(Orders),
        Orders[Status] = "Returned"
    ),
    COUNTROWS(Orders),
    0
)
```

```DAX
Avg Delivery Days =
CALCULATE(
    AVERAGE(Orders[Delivery Days]),
    Orders[Status] = "Delivered"
)
```

---

# 🗄️ SQL Extension

The SQL section was developed in **SQL Server / SSMS** using the cleaned datasets imported through the **Import Flat File** feature.

Analytical questions include:

- **Q14:** Top 5 most valuable customers using a weighted composite score.
- **Q15:** Month-over-month revenue growth.
- **Q16:** Rolling 3-month average revenue by category.
- **Q17:** Conditional 15% discount logic for customers with 10+ orders.
- **Q18:** Average days between consecutive customer orders.
- **Q19:** Customers generating more than 30% above average revenue.
- **Q20:** Top 3 product categories by year-over-year sales increase.

These SQL tasks extend the Power BI analysis into reusable analytical queries.

---

# 📁 Suggested Repository Structure

```text
Amazon-Ecommerce-Sales-Analysis/
│
├── README.md
│
├── dashboard_screenshots/
│   ├── sales-overview.png
│   ├── product-analysis.png
│   └── individual-product-analysis.png
│
├── PowerBI/
│   └── Hiteshi_Amazon_PowerBI.pbix
│
├── SQL/
│   ├── Data_Load_Hiteshi_Amazon.sql
│   └── Objective_Questions_Hiteshi_Amazon.sql
│
├── Documentation/
│   ├── Hiteshi_Amazon_Doc.docx
│   └── Hiteshi_Amazon_Project_Presentation_Final.pptx
│
└── Data/
    ├── Orders_Cleaned.csv
    └── Customers_Cleaned.csv
```

> Add only the files you are comfortable making public. Large PBIX/CSV files can also be stored separately and linked from the repository.

---

# 🚀 How to Explore the Project

1. Open the `.pbix` file in Power BI Desktop.
2. Review the **Sales Analysis** dashboard first for the overall business view.
3. Explore the **Product Analysis** dashboard for category and product performance.
4. Use the **Individual Product Analysis** page for product-level drill-down.
5. Review the SQL folder for the analytical extension and Q14–Q20 queries.

---

# 📌 Project Outcome

This project turns cleaned e-commerce data into an interactive decision-support solution covering:

**Sales → Customers → Products → Delivery → Returns → Recommendations**

The main objective is not only to report numbers, but to connect the numbers to **business questions, customer value, operational friction, and measurable next actions**.

---

## 👤 Author

**Hiteshi Aglawe**  
B.Tech — Computer Science  
Power BI / Data Analytics Project

---
