# distutils: language=c++

cdef extern from "../src/RoadMark.cpp":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "RoadMark.h" namespace "odr":
    cdef cppclass RoadMarksLine:
        RoadMarksLine(string road_id, double lanesection_s0, int lane_id, double group_s0, double width, double length, double space, double t_offset, double s_offset, string name, string rule) except +

        string road_id
        double lanesection_s0
        int lane_id
        double group_s0

        double width
        double length
        double space
        double t_offset
        double s_offset

        string name
        string rule
        
    cdef cppclass RoadMarkGroup:
        RoadMarkGroup(string road_id, double lanesection_s0, int lane_id, double width, double height, double s_offset, string type, string weight, string color, string material, string lane_change) except +

        string road_id
        double lanesection_s0
        int lane_id

        double width
        double height
        double s_offset

        string type
        string weight
        string color
        string material
        string lane_change

        set[RoadMarksLine] roadmark_lines

    cdef cppclass RoadMark:
        RoadMark(string road_id, double lanesection_s0, int lane_id, double group_s0, double s_start, double s_end, double t_offset, double width, string type) except +

        string road_id
        double lanesection_s0
        int lane_id
        double group_s0

        double s_start
        double s_end
        double t_offset
        double width

        string type

cdef class PyRoadMark:
    cdef shared_ptr[RoadMark] c_self