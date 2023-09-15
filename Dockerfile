FROM trinodb/trino:latest

ENV TMP=/tmp
ENV TRPATH=/usr/lib/trino
ENV TRDATA=/data/trino
ENV TRETC=/etc/trino
WORKDIR /tmp

RUN touch ${TMP}/exec.sh 
RUN echo '#!/bin/sh' > ${TMP}/exec.sh
RUN echo "./usr/lib/trino/bin/run-trino" >> ${TMP}/exec.sh
RUN echo "echo 'Se inicio el servidor'" >> ${TMP}/exec.sh
RUN echo 'tail -f /dev/null' >> ${TMP}/exec.sh

RUN chmod +x ${TMP}/exec.sh
RUN chmod -R ugo+rwx ${TRPATH}
RUN chmod -R ugo+rwx ${TRDATA}
RUN chmod -R ugo+rwx ${TRETC}
ENTRYPOINT $(echo ${TMP}/exec.sh)
