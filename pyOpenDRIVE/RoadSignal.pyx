# distutils: language=c++

from pyOpenDRIVE cimport RoadSignal

cdef class PyRoadSignal:
    def __cinit__(self, string road_id, string id, string name, double s0, double t0, bool is_dynamic, double zOffset, double value, double height, double width, double hOffset, double pitch, double roll, string orientation, string country, string type, string subtype, string unit, string text):
        self.c_self = make_shared[RoadSignal](road_id, id, name, s0, t0, is_dynamic, zOffset, value, height, width, hOffset, pitch, roll, orientation, country, type, subtype, unit, text)