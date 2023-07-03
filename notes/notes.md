# Notes

## Installing git from source on shared host:
- https://joemaller.com/908/how-to-install-git-on-a-shared-host/
- git_from_source.html

## Installing a gcc version
- source: https://www.hongliangjie.com/2012/07/20/how-to-install-gcc-higher-version-in-alternative-directory/
- Download the latest GCC from http://gcc.gnu.org/
    - curl -LO https://..../gcc-XXX.tar.gz
- Untar the package
    - tar -xzvf <file>.tar.gz
- Go to the source directory.
- Do "contrib/download_prerequisites".
- Create a new directory called "gcc-build" visible to the source directory, "cd gcc-build".
- In "gcc-build", perform "../gcc-XXX/configure -prefix=/usr/local"
- Do "make" and "make install"
- [optional] Add "/usr/local/lib" or "/usr/local/lib64" into your LD_LIBRARY_PATH and LD_RUN_PATH

