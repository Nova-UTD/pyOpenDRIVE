# distutils: language=c++

from pyOpenDRIVE.OpenDriveMap cimport OpenDriveMap
from pyOpenDRIVE.Road import PyRoad
from pyOpenDRIVE.Road cimport PyRoad
from pyOpenDRIVE.Junction import PyJunction
from pyOpenDRIVE.Junction cimport PyJunction

cdef class PyOpenDriveMap:
    def __cinit__(self, const string& xodr_file, bool center_map = False, bool with_road_objects = True, bool with_lateral_profile = True, bool with_lane_height = True, bool abs_z_for_for_local_road_obj_outline = False, bool fix_spiral_edge_cases = True, bool with_road_signals = True):
        self.c_self = make_shared[OpenDriveMap](xodr_file, center_map, with_road_objects, with_lateral_profile, with_lane_height, abs_z_for_for_local_road_obj_outline, fix_spiral_edge_cases, with_road_signals)

    def get_roads(self):
        out_arr = []
        cdef vector[Road] c_objs = self.c_self.get().get_roads()
        for i in range(c_objs.size()):
            out_val = PyRoad.wrap(c_objs[i])
            out_arr.append(out_val)
        return out_arr

    def get_junctions(self):
        out_arr = []
        cdef vector[Junction] c_objs = self.c_self.get().get_junctions()
        for i in range(c_objs.size()):
            out_val = PyJunction.wrap(c_objs[i])
            out_arr.append(out_val)
        return out_arr