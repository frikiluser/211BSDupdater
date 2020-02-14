cd ..
rm -fv 211BSDupdater.tar
tar cf 211BSDupdater.tar 211BSDupdater/*
211BSDupdater/mksimtape 211BSDupdater.tar > 211BSDupdater.tar.tape
