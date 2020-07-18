FROM archlinux:latest as builder

RUN pacman -Syu fontconfig graphite harfbuzz icu zlib biber yay
RUN yay -Syu tectonic
RUN cargo install tectonic --force --vers 0.1.11

WORKDIR /usr/src/text
RUN tectonic --keep-intermediates --reruns 0 main.tex
RUN biber main
RUN for f in *.tex do tectonic $f; done
