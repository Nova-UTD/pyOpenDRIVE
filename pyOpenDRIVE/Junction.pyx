# distutils: language=c++

from pyOpenDRIVE cimport Junction

cdef class PyJunction:
    def __cinit__(self, string name, string id):
        self.c_self = make_shared[Junction](name, id)