# Use the official Azure Functions Python 4 image as the base
FROM mcr.microsoft.com/azure-functions/python:4-python3.11

# Copy the function app code into the container
COPY . /home/site/wwwroot

# (Optional) Set the working directory
WORKDIR /home/site/wwwroot
