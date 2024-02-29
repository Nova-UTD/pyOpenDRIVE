# distutils: language=c++

from pyOpenDrive cimport RoadObject

cdef class PyRoadObject:
    def __cinit__(self, string road_id, string id, double s0, double t0, double z0, double length, double valid_length, double width, double radius, double height, double hdg, double pitch, double roll, string type, string name, string orientation, string subtype, bool is_dynamic):
        self.c_self = make_shared[RoadObject](road_id, id, s0, t0, z0, length, valid_length, width, radius, height, hdg, pitch, roll, type, name, orientation, subtype, is_dynamic)