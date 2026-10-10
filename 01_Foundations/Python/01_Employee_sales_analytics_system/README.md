# Employee Sales Analytics System

A menu-driven Python console application that analyzes employee sales performance using modular programming, dictionaries, functions, and descriptive sales analytics. The system provides business insights, dynamic employee search, and automated performance reporting.

## Preview
![Menu & Search System](Screenshots/analytics_search_system.png)
![Sales Performance Report](Screenshots/sales_report.png)

## Project Overview
This project simulates a small employee sales management system where users can analyze sales performance through an interactive menu. The application performs multiple analytical operations on employee sales data and demonstrates core Python programming concepts — functions, dictionaries, loops, and conditional logic — without relying on external libraries.

## How to Run
1. Clone this repository
2. Open `01_Employee_Sales_Analytics_System.ipynb` in Jupyter Notebook, Google Colab, or VS Code
3. Run all cells — the interactive menu will launch directly in the notebook output

## Features
- Total Sales Calculation
- Highest & Lowest Sales Performer
- Above Average Employees
- Department-wise Sales Analytics
- Top 3 Performing Employees
- Employee Search (by ID or Name)
- Dynamic Employee Rating based on Sales Performance
- Complete Sales Performance Report
- Interactive Menu-Driven Navigation
- Modular, reusable function-based design

## Key Insights
- **Arbaz is the top performer ($125,000), exceeding target by 25%** — worth investigating what's driving this over-performance to identify replicable strategies for the rest of the team.
- **John is below target ($65,000 vs. $70,000 target)** — a single underperformer in a 4-person team isn't yet a concerning pattern, but flags a candidate for coaching/support review.
- **Electronics is the highest-performing department**, driven largely by two strong individual performers — worth tracking whether this is department-wide strength or concentrated in specific employees.

## Technologies & Concepts Used
- Python 3 (no external libraries — core language only)
- Functions (positional, default, and return-based logic)
- Dictionaries (nested data storage and retrieval)
- Loops & Conditional Statements
- Console-based Interactive User Interface

## Project Structure
```text
Mini_Project_1_Employee_Sales_Analytics_System
│
├── 01_Employee_Sales_Analytics_System.ipynb
├── README.md
└── Screenshots
    ├── analytics_search_system.png
    └── sales_report.png
```

## What I'd Improve With More Time
- Add input validation (try/except) to handle non-numeric menu input gracefully
- Store employee data in CSV/Excel instead of hardcoding, to support larger, more realistic datasets
- Introduce Pandas for scaled data analysis and comparison with the current pure-Python approach
- Add data visualizations (bar/pie charts) for department and performance breakdowns
- Connect to a SQL database for persistent data storage
- Build a simple GUI or web interface as an alternative to the console menu

## Skills Demonstrated
- Python programming fundamentals (functions, dictionaries, control flow)
- Modular code design and reusable function architecture
- Descriptive sales performance analysis
- Debugging and self-QA (see "Bugs I Found & Fixed" above)
- Console application development and UX design