# based on https://hub.docker.com/r/rocker/rstudio/
FROM rocker/rstudio

LABEL maintainer="jannetta.steyn@newcastle.ac.uk"

COPY add_shiny.sh /etc/cont-init.d/add
RUN export ADD=shiny && bash /etc/cont-init.d/add

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y r-cran-data.table zlib1g-dev texlive texlive-latex-extra 

RUN Rscript -e 'install.packages("tidyverse")'
COPY addusers .
COPY delusers .

