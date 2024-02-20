#FROM 10.40.1.4:5000/python:3.7
FROM python:3.7
#FROM registry.360.one/360one/wealth_distribution/altiore/backend/altiore-proposal/python:3.7
 
ARG req_file=requirements.txt
 
RUN mkdir -p /var/log/altiore_proposal/ /var/www/
WORKDIR /usr/src/app
 
COPY requirements /usr/src/app/requirements
COPY requirements.txt /usr/src/app/
 
RUN apt-get update \
    #&& rm -rf /var/cache/apk/* \
    #&& apt-get --no-cache=true \
    #poppler-utils qpdf openldap-dev \
    #python3-dev libffi-dev gcc  musl-dev \
&& pip install --upgrade pip \
&& pip install -r requirements.txt \
&& rm -rf .cache/pip
 
COPY . /usr/src/app/
RUN chmod +x /usr/src/app/deployment/gunicorn_start.sh
ENV PYTHONPATH $PYTHONPATH:/usr/src/app/
EXPOSE 8001

has context menu
