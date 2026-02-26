FROM python:3.11-slim

WORKDIR /usr/app

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip first (good practice)
RUN pip install --no-cache-dir --upgrade pip

# Install exact locked versions
RUN pip install --no-cache-dir \
    dbt-core==1.11.6 \
    dbt-postgres==1.10.0

ENTRYPOINT ["dbt"]
