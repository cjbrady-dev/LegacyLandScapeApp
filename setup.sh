#!/bin/bash

echo "Starting project setup..."

# 1. Check Node
if ! command -v node &> /dev/null
then
    echo "Node.js is not installed. Install Node LTS first."
    exit
fi

# 2. Install Node dependencies
echo "Installing Node dependencies..."
npm install

# 3. Check Python
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed."
    exit
fi

# 4. Create virtual environment
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
fi

# 5. Activate venv
source .venv/bin/activate

# 6. Install Python dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    python3 -m pip install --upgrade pip
    pip install -r requirements.txt
fi

# 7. Prisma (optional)
if [ -d "prisma" ]; then
    echo "Generating Prisma client..."
    npx prisma generate
fi

echo ""
echo "Setup complete!"
echo "To activate venv later: source .venv/bin/activate"