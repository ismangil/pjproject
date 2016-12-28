FROM ubuntu:14.04
RUN apt-get update && apt-get install -y subversion python-svn
RUN svn --trust-server-cert --non-interactive checkout https://wush.net/svn/pjsip-labs/ccdash
RUN cd ccdash && python setup install --home=~ && cd ..

COPY . /pjproject
