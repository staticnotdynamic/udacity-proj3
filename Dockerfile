# TODO:
# 1. use repo_name/image_name when building
# 2. find out why pip is being run on every build
# 3. use a production-grade WSGI server like gunicorn
FROM python:3.7-slim-buster

LABEL maintainer="Test maintainer <test@mailserver.org>"

# Create a working directory
WORKDIR /ml-app

# Copy current directory on the machine to working directory on the image
COPY . ./

# Install packages from requirements.txt
# The option no-cache-dir helps reduce the image size
# hadolint ignore=DL3013
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 80 (use as: docker run -d -p 8080:80)
EXPOSE 80

# Run app.py at container launch
CMD [ "python", "app.py" ]

