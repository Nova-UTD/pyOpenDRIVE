# distutils: sources = OpenDriveMap.cpp
# distutils: language = c++

from OpenDriveMap cimport OpenDriveMap

cdef class PyOpenDriveMap:
    cdef OpenDriveMap *c_odm

    def __init__(self, const string& xodr_file, bool center_map = False, bool with_road_objects = True, bool with_lateral_profile = True, bool with_lane_height = True, bool abs_z_for_for_local_road_obj_outline = False, bool fix_spiral_edge_cases = True, bool with_road_signals = True):
        self.c_odm = new OpenDriveMap(xodr_file, center_map, with_road_objects, with_lateral_profile, with_lane_height, abs_z_for_for_local_road_obj_outline, fix_spiral_edge_cases, with_road_signals)
    
    def get_roads(self):
        return self.c_odm.get_roads()
    
    def get_junctions(self):
        return self.c_odm.get_junctions()

    @property
    def proj4(self):
        return self.c_odm.proj4
    @proj4.setter
    def proj4(self, proj4):
        self.c_odm.proj4 = proj4

    @property
    def x_offs(self):
        return self.c_odm.x_offs
    @x_offs.setter
    def x_offs(self, x_offs):
        self.c_odm.x_offs = x_offs

    @property
    def y_offs(self):
        return self.c_odm.y_offs
    @y_offs.setter
    def y_offs(self, y_offs):
        self.c_odm.y_offs = y_offs

    @property
    def xodr_file(self):
        return self.c_odm.xodr_file