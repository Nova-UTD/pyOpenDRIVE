# distutils: language=c++

from pyOpenDrive cimport LaneSection

cdef class PyLaneSection:
    def __cinit__(self, string road_id, double s0):
        self.c_self = make_shared[LaneSection](road_id, s0)