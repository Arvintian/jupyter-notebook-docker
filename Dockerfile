FROM jupyter/base-notebook:0d96d93393f7

# BUILD
ADD requirements.txt /build/
RUN pip install -r /build/requirements.txt
# CONFIG
COPY jupyter_notebook_config.py /etc/jupyter/