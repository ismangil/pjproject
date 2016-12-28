FROM ubuntu:14.04
RUN apt-get install -y subversion python-svn
RUN svn checkout https://wush.net/svn/pjsip-labs/ccdash
RUN cd ccdash && python setup install --home=~ && cd ..

COPY . /pjproject
