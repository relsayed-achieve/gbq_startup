# GBQ Streamlit Dashboard Template

A standardized template for connecting to Google BigQuery and building Streamlit dashboards with HTML export functionality.

## Features

- **Multiple Authentication Methods**
  - Local/Browser Auth (using `gcloud` CLI)
  - Service Account JSON file upload
  - Direct JSON paste

- **Pre-configured for FFN BigQuery**
  - Project ID: `ffn-dw-bigquery-prd`
  - Ready-to-use connection settings

- **Dashboard Layout**
  - Tab-based navigation
  - Sidebar filters and controls
  - Metric cards
  - Responsive column layouts
  - SQL query editor with caching

- **HTML Report Export**
  - Standalone HTML reports with embedded charts
  - Vega-Lite/Altair chart support
  - Download button integration

## Quick Start

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```

### 2. Authenticate with GCP

**Option A: Local Authentication (Recommended for Development)**
```bash
gcloud auth application-default login
```

**Option B: Service Account**
- Obtain a service account JSON key from your GCP admin
- Upload via the sidebar in the app

### 3. Run the App

```bash
streamlit run app.py
```

## Project Structure

```
gbq_startup/
├── app.py              # Main Streamlit application template
├── requirements.txt    # Python dependencies
└── README.md          # This file
```

## Configuration

| Setting | Value |
|---------|-------|
| **Project ID** | `ffn-dw-bigquery-prd` |
| **Default Cache TTL** | 600 seconds |

## Customization

1. **Add Filters**: Modify the sidebar section to add custom filters
2. **Add Queries**: Update the SQL queries in the query sections
3. **Add Tabs**: Extend the `st.tabs()` section for more views
4. **Add Charts**: Use the `create_time_series_chart()` helper or add your own

## Helper Functions

| Function | Description |
|----------|-------------|
| `build_where_clause()` | Build dynamic SQL WHERE clauses from filters |
| `run_query()` | Execute BigQuery queries with caching |
| `create_time_series_chart()` | Create standardized Altair time series charts |
| `generate_html_report()` | Generate downloadable HTML reports |
| `add_html_download_button()` | Add download button to sidebar |

## Dependencies

- `streamlit` - Web application framework
- `google-cloud-bigquery` - BigQuery client
- `google-auth` - Google authentication
- `pandas` - Data manipulation
- `altair` - Declarative visualization
- `plotly` - Interactive charts

## License

Internal use only.
