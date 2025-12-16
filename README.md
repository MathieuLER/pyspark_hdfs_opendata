# JupyterLab with PySpark

This project sets up a JupyterLab environment with PySpark using Docker and Docker Compose.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. Clone this repository.
2. Build and start the Docker container using Docker Compose:

```bash
docker-compose up --build
```

3. Access JupyterLab in your web browser at `http://localhost:8888`.

## Project Structure

- `Dockerfile`: Defines the Docker image for the JupyterLab environment.
- `docker-compose.yml`: Defines the Docker Compose configuration.
- `pyproject.toml`: Contains the Python dependencies for the project.
- `README.md`: This file.

## Environment Variables

The following environment variables are set in the Docker container:

- `SPARK_HOME`: Path to the Spark installation.
- `PYTHONPATH`: Path to the Python libraries.
- `PATH`: Path to the Spark binaries.
- `PYSPARK_PYTHON`: Path to the Python interpreter.
- `PYSPARK_DRIVER_PYTHON`: Path to the Python interpreter for the Spark driver.

## License

This project is licensed under the MIT License - see the LICENSE file for details.