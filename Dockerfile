FROM jekyll/jekyll:3.8

RUN mkdir -p /srv/jekyll && \
    mkdir -p /usr/local/bundle

COPY . /srv/jekyll

WORKDIR /srv/jekyll
EXPOSE 4000 80

CMD [ "bundle", "install"]

# ENTRYPOINT [ "bundle", "exec"]
# CMD [ "jekyll", "server", "--watch", "--drafts" "--incremental"]