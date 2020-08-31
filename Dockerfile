# https://hub.docker.com/r/rocker/rstudio/
FROM rocker/rstudio
COPY add_shiny.sh /etc/cont-init.d/add
RUN export ADD=shiny && bash /etc/cont-init.d/add

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y r-cran-data.table zlib1g-dev shape texlive texlive-latex-extra

COPY install_packages.r .
RUN Rscript install_packages.r

