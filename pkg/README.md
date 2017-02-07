## Instructions

Run the following commands:

1. `topkg tag v0.2.1` - set the correct version here
2. `tar -zvcf package.tar.gz .` - create archive of repo
3. Create release in Github
4. `topkg opam pkg --pkg-descr=./simple-diff.0.1/descr --pkg-opam=./opam --dist-uri=https://github.com/gjaldon/simple-diff/archive/v0.2.1.tar.gz --dist-file=package.tar.gz`
