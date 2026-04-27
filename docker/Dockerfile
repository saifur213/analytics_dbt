# =========================
#        BUILDER STAGE
# =========================
FROM python:3.11-slim AS builder

WORKDIR /app

# System dependencies (for dbt + snowflake + cryptography)
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libffi-dev \
    libssl-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy only runtime requirements first (better caching)
COPY requirements-runtime.txt .

# Create virtual environment
RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements-runtime.txt


# =========================
#        RUNTIME STAGE
# =========================
FROM python:3.11-slim

WORKDIR /app

# Install only minimal runtime dependencies
RUN apt-get update && apt-get install -y \
    git \
    openssl \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy virtual environment from builder
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Python optimizations
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# dbt profiles directory (standard practice)
ENV DBT_PROFILES_DIR=/root/.dbt

RUN mkdir -p /root/.dbt

# -------------------------
# Copy project files
# -------------------------

# (Better than COPY . . for production safety)
COPY dbt_project.yml .
COPY models/ models/
COPY macros/ macros/
COPY snapshots/ snapshots/
COPY seeds/ seeds/
COPY tests/ tests/
COPY packages.yml .

# Profiles (or mount via volume in CI)
COPY profiles.yml /root/.dbt/profiles.yml

# Entry script
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# -------------------------
# Default entrypoint
# -------------------------
ENTRYPOINT ["/entrypoint.sh"]

# Default command (can be overridden)
CMD ["debug"]