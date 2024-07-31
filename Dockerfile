FROM rocker/rstudio:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    nscd nslcd ldap-utils git \
    && apt-get clean
RUN apt-get util-linux libdevil-dev libcurl4-openssl-dev \
    libxml2-dev libudunits2-dev default-jdk libpng-dev \
    libssl-dev libfontconfig1-dev libgit2-dev libcairo2-dev \
    libxt-dev cmake libpq-dev libproj-dev gdal-bin proj-data \
    libgeos-dev libharfbuzz-dev libfribidi-dev gdal-bin proj-bin \
    libgdal-dev libproj-dev gdebi-core libmagick++-dev libgmp-dev \
    libmpfr-dev libgsl-dev

RUN R -e "install.packages('BiocManager' ,dependencies=TRUE, repos='http://cran.rstudio.com/')"

COPY iniciar_rstudio.sh /root/iniciar_rstudio.sh
RUN chmod +x /root/iniciar_rstudio.sh

# ---- Instale os pacotes aqui ----

# --------------------------------

EXPOSE 8787

ENTRYPOINT ["/root/iniciar_rstudio.sh"]
