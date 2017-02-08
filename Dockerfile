FROM ubuntu:14.04
RUN apt-get update && apt-get install -y build-essential subversion python-svn curl
RUN svn --trust-server-cert --non-interactive checkout https://wush.net/svn/pjsip-labs/ccdash && cd ccdash && python setup.py install --home=~ && cd ..

COPY . /pjproject
RUN cd /pjproject && timestamp=$(date +%Y%m%d-%H%M) && ls && python ~/lib/python/ccdash.py configure "./configure" \
    -U http://my.cdash.org/submit.php?project=PJSIP \
    -S shippable-ci \
    -T $timestamp \
    -B linux-gcc \
    -G Continuous && \
		python ~/lib/python/ccdash.py build "make dep && make all" \
		     -U http://my.cdash.org/submit.php?project=PJSIP \
		     -S shippable-ci \
		     -T $timestamp \
		     -B linux-gcc \
		     -G Continuous
