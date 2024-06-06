FROM python:3.7-slim
RUN pip install flask
RUN pip install mysql-connector-python
COPY controllers/* /app/app.py
RUN mkdir /app/templates
RUN mkdir /app/static
COPY templates/* /app/templates/
COPY static/* /app/static/
RUN chmod -R a+rwx /app/templates
RUN chmod -R a+rwx /app/static
WORKDIR /app
CMD ["python","app.py"]
