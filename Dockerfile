FROM dockerfile/java:oracle-java7

MAINTAINER Andreas Jung <info@zopyx.com>

RUN apt-get update
RUN apt-get install -y \
    python-virtualenv \
    python \
    curl expect \
    build-essential \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libbz2-dev \
    zlib1g-dev \
    python-setuptools \
    python-dev \
    libjpeg62-dev \
    libreadline-gplv2-dev \
    python-imaging \
    wv \
    poppler-utils \
    python-dev \
    libxml2-dev \
    libxslt1-dev \
    git-core  


RUN apt-get install -y subversion
RUN useradd -ms /bin/bash plone

USER plone
WORKDIR /home/plone

RUN virtualenv .
RUN git clone https://github.com/plone/buildout.coredev.git
WORKDIR buildout.coredev
RUN git checkout 5.0
#RUN ../bin/python bootstrap.py --setuptools-version=7.0 --version=2.2.5 -c buildout-plone-4.3.cfg
RUN ../bin/python bootstrap.py 
RUN bin/buildout 

EXPOSE 8080

EXPOSE 8080 8443 12020
