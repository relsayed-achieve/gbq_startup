# GBQ Streamlit Dashboard Template

A standardized template for connecting to Google BigQuery and building Streamlit dashboards with HTML export functionality.

---

## Prerequisites Checklist

Before you begin, you'll need to install a few things. Follow the steps below based on your operating system.

### Step 1: Install Python (if not already installed)

**Check if Python is installed:**
```bash
python3 --version
```
If you see a version number (e.g., `Python 3.11.5`), you're good! Skip to Step 2.

**macOS:**
```bash
# Install Homebrew first (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Python
brew install python
```

**Windows:**
1. Download Python from [python.org](https://www.python.org/downloads/)
2. Run the installer
3. **IMPORTANT:** Check the box "Add Python to PATH" during installation
4. Restart your terminal/command prompt

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

---

### Step 2: Install Google Cloud SDK (for BigQuery authentication)

**macOS:**
```bash
brew install --cask google-cloud-sdk
```

**Windows:**
1. Download from [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
2. Run the installer
3. Follow the prompts

**Linux:**
```bash
# Add the Cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update and install
sudo apt update && sudo apt install google-cloud-sdk
```

**Verify installation:**
```bash
gcloud --version
```

---

## Quick Start Guide

### Step 1: Clone this repository

```bash
git clone https://github.com/relsayed-achieve/gbq_startup.git
cd gbq_startup
```

### Step 2: Create a virtual environment (recommended)

A virtual environment keeps your project dependencies isolated.

**macOS/Linux:**
```bash
# Create virtual environment
python3 -m venv venv

# Activate it
source venv/bin/activate
```

**Windows (Command Prompt):**
```cmd
# Create virtual environment
python -m venv venv

# Activate it
venv\Scripts\activate
```

**Windows (PowerShell):**
```powershell
# Create virtual environment
python -m venv venv

# Activate it
.\venv\Scripts\Activate.ps1
```

> 💡 **Tip:** You'll know it's activated when you see `(venv)` at the beginning of your terminal prompt.

### Step 3: Install dependencies

```bash
pip install -r requirements.txt
```

This will install:
- Streamlit (web app framework)
- Google Cloud BigQuery (database connection)
- Pandas (data processing)
- Altair & Plotly (charts)

### Step 4: Authenticate with Google Cloud

**First-time setup:**
```bash
# Login to Google Cloud
gcloud auth login

# Set up application default credentials (required for BigQuery)
gcloud auth application-default login
```

A browser window will open. Sign in with your Google account that has access to the BigQuery project.

### Step 5: Run the app

```bash
streamlit run app.py
```

The app will open in your default browser at `http://localhost:8501`

---

## Troubleshooting

### "command not found: python3"
- Make sure Python is installed and added to your PATH
- On Windows, try `python` instead of `python3`

### "command not found: pip"
```bash
# macOS/Linux
python3 -m ensurepip --upgrade

# Windows
python -m ensurepip --upgrade
```

### "command not found: streamlit"
Make sure you've activated your virtual environment:
```bash
source venv/bin/activate  # macOS/Linux
venv\Scripts\activate     # Windows
```

### "Could not connect using default credentials"
Run the authentication command:
```bash
gcloud auth application-default login
```

### Permission denied errors on Windows PowerShell
Run this command first:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### SSL Certificate errors
```bash
pip install --upgrade certifi
```

---

## Project Structure

```
gbq_startup/
├── app.py              # Main Streamlit application
├── requirements.txt    # Python dependencies
├── README.md           # This file
└── venv/               # Virtual environment (created by you, not in repo)
```

---

## Features

### Authentication Methods
- **Local/Browser Auth** - Uses `gcloud` CLI (recommended)
- **Service Account JSON** - Upload a key file
- **Paste JSON** - Quick testing option

### Dashboard Components
- Tab-based navigation
- Sidebar filters and controls
- Metric cards
- SQL query editor with caching
- Responsive layouts

### HTML Export
- Standalone HTML reports
- Embedded interactive charts
- One-click download

---

## Configuration

| Setting | Value |
|---------|-------|
| **Project ID** | `ffn-dw-bigquery-prd` |
| **Default Cache TTL** | 600 seconds |
| **Default Port** | 8501 |

---

## Customization Guide

### Adding a New Filter
```python
# In the sidebar section, add:
my_filter = st.multiselect("My Filter", options=["Option1", "Option2"])
```

### Adding a New Tab
```python
# Change this line:
tab1, tab2, tab3 = st.tabs(["📊 Overview", "📈 Analysis", "⚙️ Settings"])

# To this:
tab1, tab2, tab3, tab4 = st.tabs(["📊 Overview", "📈 Analysis", "🆕 New Tab", "⚙️ Settings"])

# Then add content:
with tab4:
    st.header("My New Tab")
    # Your content here
```

### Modifying the SQL Query
Find the `example_query` variable and update it with your table and columns.

---

## Useful Commands Reference

| Task | Command |
|------|---------|
| Activate venv (macOS/Linux) | `source venv/bin/activate` |
| Activate venv (Windows) | `venv\Scripts\activate` |
| Deactivate venv | `deactivate` |
| Run the app | `streamlit run app.py` |
| Install new package | `pip install package_name` |
| Update requirements | `pip freeze > requirements.txt` |
| GCP Login | `gcloud auth login` |
| GCP App Default Login | `gcloud auth application-default login` |

---

## Getting Help

If you run into issues:
1. Check the Troubleshooting section above
2. Make sure your virtual environment is activated
3. Verify your GCP credentials are set up correctly

---

## License

Internal use only.
