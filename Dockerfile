FROM ruby
RUN apt-get -y update 
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get install -y -q apt-utils dialog 
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN gem install gollum
RUN gem install org-ruby  # optional
WORKDIR /wiki
ADD ./config.rb /wiki/config.rb
CMD ["gollum", "--port", "80", "--config", "config.rb"]
EXPOSE 80
