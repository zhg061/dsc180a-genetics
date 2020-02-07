FROM ucsdets/scipy-ml-notebook:2019.4.6

USER root

# Install GATK
#FROM broadinstitute/gatk:4.1.4.1

RUN pwd && \
    apt-get update && \
    apt-get install --yes default-jdk && \
    cd /opt && \
    wget -q https://github.com/broadinstitute/gatk/releases/download/4.1.4.1/gatk-4.1.4.1.zip && \
    unzip -q gatk-4.1.4.1.zip && \
    ln -s /opt/gatk-4.1.4.1/gatk /usr/bin/gatk && \
    rm gatk-4.1.4.1.zip && \
    cd /opt/gatk-4.1.4.1 && \
    ls -al  && \
    cd /home/jovyan

# Install PLINK2
RUN conda install --quiet --yes -c bioconda plink2

# install BWA
RUN conda install -c bioconda bwa

