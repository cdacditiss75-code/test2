FROM python
WORKDIR \app
COPY hey.py .
CMD ["python3","hey.py"]
