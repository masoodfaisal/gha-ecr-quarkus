FROM amazonlinux:2023

# Set working directory.
WORKDIR /app

# Install Python and dependencies
RUN dnf update -y && \
    dnf install -y python3 python3-pip && \
    dnf clean all

# Copy requirements and install Python packages
COPY customer-api/requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy application code
COPY customer-api/get-customer-info.py .

# Expose port
EXPOSE 8000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python3", "get-customer-info.py"]
