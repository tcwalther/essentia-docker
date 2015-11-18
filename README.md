# essentia-docker
Dockerfile based on Debian Jessie that comes with Essentia precompiled. Compiles Essentia from Git. To compile a specific version, modify the image and specify a specific Git commit to checkout.

Note that all compilation commands are in a single `RUN` instruction to keep the size of the resulting Docker image small.
