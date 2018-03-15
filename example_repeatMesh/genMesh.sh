#!/bin/bash
# vim: set fileencoding=utf-8 fileformat=unix :
# -*- coding: utf-8 -*-
# vim: set ts=8 et sw=4 sts=4 sta :


rm -rf constant/polyMesh
blockMesh -dict "system/blockMeshDict" -region "."

topoSet -dict "system/topoSetDict" -region "."
refineHexMesh -overwrite -region "." -minSet highRes
#refineMesh -overwrite -dict "system/refineMeshDict"

refineWallLayer -overwrite "(ground)" .5
refineWallLayer -overwrite "(building)" .5

renumberMesh -overwrite -region "."

../repeatMesh.sh -no-blockMesh -x 3 -y 5


