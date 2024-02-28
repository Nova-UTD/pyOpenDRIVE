# distutils: language=c++

from pyOpenDrive.Mesh cimport Mesh3D

cdef class PyMesh3D:
    def __cinit__(self):
        self.c_self = make_shared[Mesh3D]()