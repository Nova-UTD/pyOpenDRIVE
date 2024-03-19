# distutils: language=c++

from pyOpenDRIVE cimport Junction

cdef class PyJunction:
    def __cinit__(self, string name = "", string id = ""):
        if name != "":
            self.c_self = make_shared[Junction](name, id)

    @property
    def name(self):
        return self.unwrap().name

    @property
    def id(self):
        return self.unwrap().id