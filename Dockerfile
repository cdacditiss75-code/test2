FROM python:3.9-alpine
WORKDIR \app
COPY hey.py .
CMD ["python3","hey.py"]
