# distutils: language=c++

cdef extern from "../src/OpenDriveMap.cpp":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.string cimport string
from libcpp cimport bool

cdef extern from "OpenDriveMap.h" namespace "odr":
    cdef cppclass OpenDriveMap:
        OpenDriveMap(const string& xodr_file, const bool center_map = false, const bool with_road_objects = true, const bool with_lateral_profile = true, const bool with_lane_height = true, const bool abs_z_for_for_local_road_obj_outline = false, const bool fix_spiral_edge_cases = true, const bool with_road_signals = true)

        vector[Road] get_roads() const
        vector[Junction] get_junctions() const

        RoadNetworkMesh get_road_network_mesh(const double eps) const
        RoutingGraph get_routing_graph() const

        string proj4
        double x_offs
        double y_offs
        const string xodr_file
        xml_document xml_doc

        map[string, Road] id_to_road
        map[string, Junction] id_to_junction