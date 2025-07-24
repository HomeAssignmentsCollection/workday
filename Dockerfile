# ------------------------------------------------------------------------------
# Best practices for Dockerfile (Python):
#
# 1. Use minimal base images (e.g., python:3.9-slim).
# 2. Apply multi-stage build to reduce the final image size.
# 3. Copy requirements.txt separately to leverage dependency caching.
# 4. Install dependencies with --no-cache-dir and --user (avoid root).
# 5. Remove temporary files and cache after installing packages.
# 6. Copy only necessary files to the final image (exclude tests, docs).
# 7. Avoid running the container as root (use a non-root user if possible).
# 8. Use ENV to set PATH and environment variables.
# 9. Minimize the number of RUN and COPY layers.
# 10. Do not store secrets or keys in the Dockerfile or image.
# 11. Use CMD/ENTRYPOINT to run the application.
# 12. Expose only required ports.
# ------------------------------------------------------------------------------

# syntax=docker/dockerfile:1

# --- Builder stage ---
FROM python:3.9-slim AS builder

WORKDIR /app

# Install system dependencies only if needed for building wheels
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy only requirements for layer caching
COPY requirements.txt .

# Install dependencies into a temporary directory
RUN pip install --user --no-cache-dir -r requirements.txt

# --- Final stage ---
FROM python:3.9-slim AS runtime

WORKDIR /app

# Copy only necessary application files
COPY . .

# Copy installed dependencies from builder stage
COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

EXPOSE 8080

CMD ["python", "bulls_web.py"]
