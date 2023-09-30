ARG PYTHON_VERSION=3.11
ARG DEBIAN_VERSION=bullseye
FROM python:${PYTHON_VERSION}-${DEBIAN_VERSION} as build
ENV PYTHONUNBUFFERED 1

ENV PROJECT_DIR /project
WORKDIR $PROJECT_DIR

########## DEV STAGE ##########
FROM build as dev

COPY requirements.txt .
RUN pip --no-cache install -r requirements.txt --no-warn-script-location

ENV PYTHONPATH "${PYTHONPATH}:${PROJECT_DIR}"
ADD . $PROJECT_DIR
