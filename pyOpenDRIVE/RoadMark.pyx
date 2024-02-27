# distutils: language=c++

from pyOpenDrive cimport RoadMark

cdef class PyRoadMark:
    def __cinit__(self, string road_id, double lanesection_s0, int lane_id, double group_s0, double s_start, double s_end, double t_offset, double width, string type):
        self.c_self = make_shared[RoadMark](road_id, lanesection_s0, lane_id, group_s0, s_start, s_end, t_offset, width, type)