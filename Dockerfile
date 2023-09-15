FROM trinodb/trino:latest

ENV TMP=/tmp
ENV TRPATH=/usr/lib/trino
WORKDIR /tmp

RUN touch ${TMP}/exec.sh 
RUN echo '#!/bin/sh' > ${TMP}/exec.sh
# RUN echo "mkdir minio-svr" >> ${TMP}/exec.sh
# RUN echo "minio server minio-svr --console-address :9090" >> ${TMP}/exec.sh
RUN echo "echo 'Se inicio el servidor'" >> ${TMP}/exec.sh
RUN echo 'tail -f /dev/null' >> ${TMP}/exec.sh

RUN chmod +x ${TMP}/exec.sh
RUN chmod -R ugo+rwx ${TRPATH}
ENTRYPOINT $(echo ${TMP}/exec.sh)
