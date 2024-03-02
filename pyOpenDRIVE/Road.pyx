# distutils: language=c++

from pyOpenDRIVE cimport Road

cdef class PyRoad:
    def __cinit__(self, string id, double length, string junction, string name, bool left_hand_traffic = False):
       self.c_self = make_shared[Road](id, length, junction, name, left_hand_traffic)

    @property
    def id(self):
        return self.c_self.get().id