FROM blang/latex:ctanfull

WORKDIR /data

RUN apt update
RUN apt install inkscape -y

RUN mkdir report_output
