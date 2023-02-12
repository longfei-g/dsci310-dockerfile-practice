FROM rocker/rstudio:4.1.3

WORKDIR /home/rstudio


COPY --chown=rstudio:rstudio renv.lock .
COPY --chown=rstudio:rstudio renv renv
COPY --chown=rstudio:rstudio .Rprofile .

RUN ls -alh

USER rstudio

RUN Rscript -e "renv::restore()"

USER root
