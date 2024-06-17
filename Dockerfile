# Use the official Python image as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/

# Install the Python dependencies
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

# Copy the rest of your application code into the container
COPY . /app/

# Expose the port the app runs on
EXPOSE 8501

# Run the application
CMD ["streamlit", "run", "app.py"]
