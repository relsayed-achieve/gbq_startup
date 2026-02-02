#!/bin/bash
# =============================================================================
# GBQ Streamlit Dashboard - Setup Script
# =============================================================================
# This script automates the setup process for macOS/Linux users.
# 
# Usage: 
#   chmod +x setup.sh
#   ./setup.sh
# =============================================================================

set -e  # Exit on any error

echo "=========================================="
echo "  GBQ Streamlit Dashboard Setup"
echo "=========================================="
echo ""

# Check for Python
echo "🔍 Checking for Python..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo "   ✅ Found: $PYTHON_VERSION"
else
    echo "   ❌ Python3 not found!"
    echo "   Please install Python first:"
    echo "   - macOS: brew install python"
    echo "   - Linux: sudo apt install python3 python3-pip python3-venv"
    exit 1
fi

# Check for pip
echo "🔍 Checking for pip..."
if python3 -m pip --version &> /dev/null; then
    echo "   ✅ pip is available"
else
    echo "   ❌ pip not found! Installing..."
    python3 -m ensurepip --upgrade
fi

# Create virtual environment
echo ""
echo "📦 Creating virtual environment..."
if [ -d "venv" ]; then
    echo "   ⚠️  venv already exists, skipping creation"
else
    python3 -m venv venv
    echo "   ✅ Virtual environment created"
fi

# Activate virtual environment
echo ""
echo "🔌 Activating virtual environment..."
source venv/bin/activate
echo "   ✅ Activated"

# Upgrade pip
echo ""
echo "⬆️  Upgrading pip..."
pip install --upgrade pip --quiet
echo "   ✅ pip upgraded"

# Install dependencies
echo ""
echo "📥 Installing dependencies..."
pip install -r requirements.txt --quiet
echo "   ✅ All dependencies installed"

# Check for gcloud
echo ""
echo "🔍 Checking for Google Cloud SDK..."
if command -v gcloud &> /dev/null; then
    GCLOUD_VERSION=$(gcloud --version | head -n 1)
    echo "   ✅ Found: $GCLOUD_VERSION"
else
    echo "   ⚠️  Google Cloud SDK not found!"
    echo "   Install it from: https://cloud.google.com/sdk/docs/install"
    echo "   Or on macOS: brew install --cask google-cloud-sdk"
    echo ""
    echo "   You can still run the app, but you'll need to use"
    echo "   JSON key authentication instead of browser auth."
fi

echo ""
echo "=========================================="
echo "  ✅ Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo ""
echo "  1. Activate the virtual environment (if not already):"
echo "     source venv/bin/activate"
echo ""
echo "  2. Authenticate with Google Cloud:"
echo "     gcloud auth application-default login"
echo ""
echo "  3. Run the app:"
echo "     streamlit run app.py"
echo ""
echo "=========================================="
