FROM jupyter/pyspark-notebook:x86_64-python-3.11.6

WORKDIR /app


# Install uv for managing Python dependencies
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy the pyproject.toml file
COPY pyproject.toml .

# Install Python dependencies (including pyspark)
RUN uv pip install --system -e .

# Copy the rest of the project files
COPY . .

# Set environment variables
ENV HADOOP_HOME=/usr/local/hadoop
ENV SPARK_HOME=/usr/local/spark-3.5.0-bin-hadoop3
ENV PYTHONPATH=/app:$SPARK_HOME/python:$HADOOP_HOME/python
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV PYSPARK_PYTHON=/opt/conda/bin/python
ENV PYSPARK_DRIVER_PYTHON=/opt/conda/bin/python

# Expose the port for JupyterLab and HDFS
EXPOSE 8888 9870 9864 9866 9867

# Command to start JupyterLab after retrieving DVC data
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]