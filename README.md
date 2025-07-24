# workday

## Project Overview

A demo Python project for the "Bulls and Cows" game with leaderboard, validation, and web interface.

## CI/CD

- Automated testing and linting with GitHub Actions (pytest + flake8)
- Docker image build workflow on every push and pull request
- All workflows are in `.github/workflows/`

## Docker

- Multi-stage Docker build for minimal and secure images
- See `Dockerfile` for best practices
- Build locally: `docker build -t bulls-and-cows:latest .`

## Healthcheck

- Health endpoint available at `/health` (returns `ok`)
- Example: `curl http://localhost:8081/health`

## Best Practices

- Linting and testing automated in CI
- No secrets in code or Dockerfile
- All dependencies pinned in `requirements.txt`
- Production readiness: healthcheck, Docker best practices, CI/CD

## How to Run

```bash
pip install -r requirements.txt
python bulls_web.py
```

Or with Docker:

```bash
docker build -t bulls-and-cows:latest .
docker run -p 8080:8080 bulls-and-cows:latest
```