# distutils: language=c++

from cython.operator cimport dereference, postincrement

from pyOpenDRIVE cimport Junction

cdef class PyJunction:
    def __cinit__(self, string name = "", string id = ""):
        if name != "":
            self.c_self = make_shared[Junction](name, id)

    @property
    def name(self):
        return self.unwrap().name

    @property
    def id(self):
        return self.unwrap().id

    @property
    def id_to_connection(self):
        out_dict = {}
        cdef map[string, JunctionConnection] c_map = self.unwrap().id_to_connection
        cdef map[string, JunctionConnection].iterator iter = c_map.begin()
        while iter != c_map.end():
            out_dict[dereference(iter).first] = PyJunctionConnection.wrap(dereference(iter).second)
            postincrement(iter)
        return out_dict

    @property
    def id_to_controller(self):
        out_dict = {}
        cdef map[string, JunctionController] c_map = self.unwrap().id_to_controller
        cdef map[string, JunctionController].iterator iter = c_map.begin()
        while iter != c_map.end():
            out_dict[dereference(iter).first] = PyJunctionController.wrap(dereference(iter).second)
            postincrement(iter)
        return out_dict