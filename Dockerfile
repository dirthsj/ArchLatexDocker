FROM whynothugo/makepkg:latest as builder

# Install tectonic
RUN yay -Syu --noconfirm tectonic
# Install ttf-font-awesome-4
RUN yay -Syu --noconfirm ttf-font-awesome-4
