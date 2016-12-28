FROM ubuntu:14.04
RUN apt-get update && apt-get install -y subversion python-svn
RUN svn --trust-server-cert --non-interactive checkout https://wush.net/svn/pjsip-labs/ccdash && cd ccdash && python setup.py install --home=~ && cd ..

COPY . /pjproject
