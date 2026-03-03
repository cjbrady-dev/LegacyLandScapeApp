# ==========
# App Setup
# Cross-Platform Windows setup.
# =========

Write-Host "Starting setup..." -ForegroundColor Cyan

# -----------------
# 1. Check Node
# -----------------
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js is not installed. Please install Node LTS first." -ForegroundColor Red
    exit
}

# -----------------
# 2. Install Node packages
# -----------------
Write-Host "Installing Node packages..." -ForegroundColor Green
npm install

# -----------------
# 3. Setup Python Virtual Enviroment
# -----------------
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Python is not installed. Please install Python 3.10+." -ForegroundColor Red
    exit
}

if (-Not (Test-Path ".\.venv")) {
    Write-Host "Creating Python virtual enviroment...." -ForegroundColor Green
    python -m venv .venv
}

Write-Host "Activating Python virtual enviroment..." -ForegroundColor Green
. .\.venv\Scripts\Activate.ps1

# -----------------
# 4. Install Python packages
# -----------------
if (Test-Path "./requirements.txt") {
    Write-Host "Installing Python dependencies..." -ForegroundColor Green
    python -m pip intall --upgrade pip
    pip install -r requirements.txt
}

# -----------------
# 5. Prisma
# -----------------
if (Test-Path "./prisma") {
    Write-Host "Setting up Prisma..." -ForegroundColor Green
    npx prisma generate
}

Write-Host ""
Write-Host "Setup complete!" -ForegroundColor Cyan
Write-Host "To start Node app: npm start or npx nodemon app.js"
Write-Host "To activate Python later: .\.venv\Scripts\Activate.ps1"