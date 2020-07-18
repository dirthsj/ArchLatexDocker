FROM archlinux:latest as builder

# Install deps
RUN pacman -Syu --noconfirm fontconfig graphite harfbuzz icu zlib biber base-devel git
# Install tectonic
RUN git clone https://aur.archlinux.org/tectonic.git && cd tectonic && makepkg -si && cd ..

WORKDIR /usr/src/text
RUN tectonic --keep-intermediates --reruns 0 main.tex
RUN biber main
RUN for f in *.tex do tectonic $f; done
