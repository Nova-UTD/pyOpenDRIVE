# distutils: language=c++

from pyOpenDRIVE cimport Lane

cdef class PyLane:
    def __cinit__(self, string road_id = "", double lanesection_s0 = 0, int id = 0, bool level = False, string type = ""):
        if road_id != "":
            self.c_self = make_shared[Lane](road_id, lanesection_s0, id, level, type)