FROM ubuntu:14.04
RUN svn checkout https://wush.net/svn/pjsip-labs/ccdash
RUN cd ccdash && python setup install --home=~ && cd ..

COPY . /pjproject
