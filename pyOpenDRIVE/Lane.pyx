# distutils: language=c++

from pyOpenDrive cimport Lane

cdef class PyLane:
    def __cinit__(self, string road_id, double lanesection_s0, int id, bool level, string type):
        self.c_self = make_shared[Lane](road_id, lanesection_s0, id, level, type)