# distutils: language=c++

from pyOpenDrive cimport OpenDriveMap
from pyOpenDrive.Road import PyRoad

cdef class PyOpenDriveMap:
    def __cinit__(self, const string& xodr_file, bool center_map = False, bool with_road_objects = True, bool with_lateral_profile = True, bool with_lane_height = True, bool abs_z_for_for_local_road_obj_outline = False, bool fix_spiral_edge_cases = True, bool with_road_signals = True):
        self.c_self = make_shared[OpenDriveMap](xodr_file, center_map, with_road_objects, with_lateral_profile, with_lane_height, abs_z_for_for_local_road_obj_outline, fix_spiral_edge_cases, with_road_signals)

    def get_roads(self):
        out_roads = []
        cdef vector[Road] c_roads = self.c_self.get().get_roads()
        for i in range(c_roads.size()):
            out_val = PyRoad()
            out_val.c_self = make_shared[Road](c_roads[i])
            out_roads.append(out_val)
        return out_roads
    
    def get_junctions(self):
        return self.c_self.get().get_junctions()
    
    def get_road_network_mesh(self, const double eps):
        return self.c_self.get().get_road_network_mesh(eps)

    def get_routing_graph(self):
        return self.c_self.get().get_routing_graph()

    @property
    def proj4(self):
        return self.c_self.get().proj4
    @proj4.setter
    def proj4(self, string proj4):
        self.c_self.get().proj4 = proj4

    @property
    def x_offs(self):
        return self.c_self.get().x_offs
    @x_offs.setter
    def x_offs(self, double x_offs):
        self.c_self.get().x_offs = x_offs

    @property
    def y_offs(self):
        return self.c_self.get().y_offs
    @y_offs.setter
    def y_offs(self, double y_offs):
        self.c_self.get().y_offs = y_offs

    @property
    def xodr_file(self):
        return self.c_self.get().xodr_file

    @property
    def xml_doc(self):
        return self.c_self.get().xml_doc
    @xml_doc.setter
    def xml_doc(self, xml_document xml_doc):
        self.c_self.get().xml_doc = xml_doc

    @property
    def id_to_road(self):
        return self.c_self.get().id_to_road
    @id_to_road.setter
    def id_to_road(self, map[string, PyRoad] id_to_road):
        self.c_self.get().id_to_road = id_to_road

    @property
    def id_to_junction(self):
        return self.c_self.get().id_to_junction
    @id_to_junction.setter
    def id_to_junction(self, map[string, PyJunction] id_to_junction):
        self.c_self.get().id_to_junction = id_to_junction