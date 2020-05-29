FROM python:3.7.3-stretch

# create working directory
WORKDIR /app

# copy source code to working directory
COPY . app.py /app/

# install packages
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# expose port
EXPOSE 80

# run app.py at container launch
CMD ["python", "app.py"]
