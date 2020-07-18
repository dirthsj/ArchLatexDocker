FROM whynothugo/makepkg:latest as builder

# Install deps
# RUN pacman -Syu --noconfirm fontconfig graphite harfbuzz icu zlib biber
# Install tectonic
RUN yay -Syu tectonic

WORKDIR /usr/src/text
RUN tectonic --keep-intermediates --reruns 0 main.tex
RUN biber main
RUN for f in *.tex do tectonic $f; done
