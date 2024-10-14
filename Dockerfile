# syntax=docker/dockerfile:1
FROM ruby:3.2.5

# Instalar dependencias del sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client curl libpq-dev

# Instalar Yarn para Webpacker (si es necesario)
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

WORKDIR /myapp

# Agregar las Gemfiles y cachear la instalación de gems
COPY Gemfile* /myapp/
RUN bundle install --jobs 4 --retry 3

# Precompilar assets si es necesario
COPY . /myapp
RUN bundle exec rails assets:precompile

# Configurar entrypoint y permisos
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

# Exponer puerto y definir el comando por defecto
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
