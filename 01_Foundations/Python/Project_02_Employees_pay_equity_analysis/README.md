# Employee Pay Equity Analysis (Excel + Python)

[![Python](https://img.shields.io/badge/Python-3.12%2B-blue?style=flat&logo=python&logoColor=white)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-orange?style=flat&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![Seaborn](https://img.shields.io/badge/Seaborn-Visualization-informational?style=flat&logo=python&logoColor=white)](https://seaborn.pydata.org/)
[![Excel](https://img.shields.io/badge/Excel-Analytics-green?style=flat&logo=microsoft-excel&logoColor=white)](https://www.microsoft.com/excel)

An end-to-end analytics project on a deliberately messy, multi-currency HR dataset: clean it, then test for pay differences by gender, ethnicity, department, experience, education and performance. The same analysis was built twice, first in **Excel** and then in **Python (pandas)**, and the two versions were cross-checked against each other.

**Business question:** *Are employees paid fairly, and which factors are associated with differences in pay?*

![Excel Dashboard](images/Dashboard_Overview.png)

---

## 📊 Key Findings

| # | Finding | Evidence |
|---|---|---|
| 1 | **Men earn more than women in all 12 departments** | Gap of 1.8% (Finance) to 8.7% (Data Science, Design); **6.2% overall** |
| 2 | **The gap persists within the same role and experience level** | In 133 of 151 comparable groups (88%), men earn more. Groups are job title x experience level, with at least 15 people per gender. Median gap: 7.1% |
| 3 | **No consistent ethnicity pattern** | Group averages are only about 3.6% apart, and no group is consistently higher or lower |
| 4 | **Experience explains little of pay** | Correlation between years of experience and salary is 0.39 (weak positive) |
| 5 | **Education and performance barely matter** | PhD and High School averages differ by about USD 500. Performance ratings all average roughly USD 45k to 46k, and review score vs salary has r = 0.01 |
| 6 | **Department pay differs more than any personal factor** | Product pays the most and varies the most. Legal pays the least and varies the least |
| 7 | **Data quality changed the results** | 463 broken salaries (2.6%) were flagged and excluded from all pay calculations |

> **Note:** these are *observed differences* in a synthetic dataset. They show where a pay review may be worthwhile. They are not proof of discrimination.

---

## 📈 Visuals

![Gender pay gap by department](images/Gender_pay_gap.png)

![Average vs median salary by department](images/Average_vs_median_salary.png)

![Experience vs salary](images/salary_vs_exp_relation.png)

![Correlation heatmap](images/Correlation_heatmap.png)

![Salary distribution](images/Salary_distribution_histogram.png)

![Business insights (Excel)](images/Business_Insights.png)

---

## 📁 Dataset

- **Source:** Kaggle, *Employee Pay Equity (messy)*, a synthetic dataset. Add link here.
- **Size:** about 96,900 rows and 19 columns. A random sample of **18,000 rows** was analysed.
- **After cleaning:** 17,927 employees, 12 departments, 14 countries and 53 job titles. 17,464 rows remain after excluding the salary outliers.
- **Problems in the raw data:** mixed date formats, 12 currencies with symbols and codes inside salary text, duplicate records, inconsistent spelling and casing, blanks, stray whitespace and implausible salaries.

---

## 🛠️ Methodology

| Step | What was done |
|---|---|
| 1. Audit | Checked every column for blanks, duplicates, spelling variants and mixed data types |
| 2. Text cleaning | Standardised gender, education, work mode, performance rating, country, department and job title |
| 3. Dates | Parsed mixed date strings into real dates, reading ambiguous ones as day/month/year |
| 4. Salary | Removed symbols and currency codes, then converted 12 currencies to USD with fixed approximate rates |
| 5. Duplicates | Removed 73 `_DUP` employee records that had a matching original ID |
| 6. Missing values | Filled numeric gaps with the mean. Used explicit labels (*Prefer not to say*, *Not rated*, *Unknown*) for demographic and categorical gaps instead of guessing |
| 7. Outliers | IQR rule for the upper limit (about USD 91.7k) plus a USD 15k floor. 463 rows were flagged, not deleted |
| 8. Features | Created age, tenure and experience groups |
| 9. Analysis | Mean, median, standard deviation, correlation, gender and ethnicity gaps by department, and gender gaps by job title and experience with sample-size checks |
| 10. Charts | Bar charts, histogram, scatter plot with trend line and a correlation heatmap |

**Cross-validation:** Excel and pandas agree closely on average salary (about USD 45.4k), standard deviation (about USD 15.8k), outlier count (463), gender gap (6.2%) and correlation (0.39), and every cleaned hire date matches. Comparing them also exposed a text-casing problem and one leftover duplicate row in the Excel version.

---

## 🧰 Tools

- **Python:** pandas, NumPy, Matplotlib, Seaborn
- **Excel (web version):** formulas (`IF`/`IFS`, `XLOOKUP`, `AVERAGEIFS`, `COUNTIFS`, `SUBSTITUTE`, text and date functions), PivotTables, charts, KPI dashboard

---

## 📂 Repository Structure

```text
├── README.md
├── Pandas_Pay_Equity_Analysis.ipynb        # cleaning and analysis in Python
├── Excel_Pay_Equity_Analysis.xlsx          # Excel workbook (the notebook reads its RAW_DATA sheet)
├── data/
│   ├── employee_pay_equity_messy.csv       # original raw dataset
│   └── cleaned_pay_equity_data.xlsx        # cleaned dataset exported from pandas
└── images/
    ├── Dashboard_Overview.png
    ├── Business_Insights.png
    ├── Gender_pay_gap.png
    ├── Average_vs_median_salary.png
    ├── salary_vs_exp_relation.png
    ├── Correlation_heatmap.png
    └── Salary_distribution_histogram.png
```

**Workbook sheets:** `RAW_DATA` · `Clean_Data` · `Business_Questions` · `pay_gap_gender` · `pay_gap_ethnicity` · `WORKFORCE` · `COMPENSATION` · `DASHBOARD` · `BUSINESS_INSIGHTS`

---

## ▶️ How to Run

1. Use Python 3.12 or newer and install the libraries: `pip install pandas numpy matplotlib seaborn openpyxl`
2. Put `Pandas_Pay_Equity_Analysis.ipynb` and `Excel_Pay_Equity_Analysis.xlsx` in the same folder.
3. Open the notebook in Jupyter or Google Colab and choose **Run All**.
4. The notebook saves its charts in the working folder. Move them into `images/`.

---

## ⚠️ Limitations

- Synthetic data, so the findings describe this dataset only.
- Exchange rates are fixed approximations, not historical rates.
- The USD 15k salary floor is a judgment call, because the IQR lower limit was negative.
- About 859 missing education levels were filled with the most common value (Bachelor's).
- Ambiguous dates such as 12/2/2022 were read as day/month/year.
- The gender value *other* was kept as its own category.
- `pay_band` was left as provided. Its ranges overlap, so management should review it.
- The gender gap compares averages. It does not prove a cause.

---

## 🚀 Next Steps

- Build an interactive dashboard in Tableau or Power BI.
- Test several factors together in a single model.

---

**Author:** Arbaz · Data Analyst in training · Excel, Python, Power BI
**GitHub:** [arbaz-analytics](https://github.com/arbaz-analytics) · **LinkedIn:** add link

