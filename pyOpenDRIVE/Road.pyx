# distutils: sources = Road.cpp
# distutils: language = c++

from OpenDriveMap cimport Road

cdef class Road:
    cdef Road*c_road

    def __init__(self, string id, double length, string junction, string name, bool left_hand_traffic = false)
        self.c_road = new Road(id, length, junction, name, left_hand_traffic)

    def get_lanesections(self):
        return self.c_road.get_lanesections()
    
    def get_junctions(self):
        return self.c_road.get_junctions()

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