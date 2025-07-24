#!/bin/bash
set -e

echo "Running flake8..."
flake8 .

echo "Running pytest..."
pytest 