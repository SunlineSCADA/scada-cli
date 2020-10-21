FROM alpine
WORKDIR /app

RUN apk add --no-cache mysql-client pv rsync gettext tar

COPY snapshot.tar.gz ./
COPY configs configs
COPY scripts scripts

RUN ln -s /app/scripts/create.sh /usr/bin/create && \
    ln -s /app/scripts/restore.sh /usr/bin/restore && \
    ln -s /app/scripts/backup.sh /usr/bin/backup && \
    ln -s /app/scripts/remove.sh /usr/bin/remove

CMD /app/scripts/create.sh
