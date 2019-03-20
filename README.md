# Jupyter-notebook

Usage:

```
docker run --rm -ti --name jupyter-test -p 8000:8000 \
        -e PORT=8000 \
        -e PASSWORD=123456 \
        -e JUPYTER_ENABLE_LAB=yes \
        arvintian/jupyter-notebook:<tag>
```