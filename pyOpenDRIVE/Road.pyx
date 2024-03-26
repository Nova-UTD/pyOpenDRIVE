# distutils: language=c++

from pyOpenDRIVE cimport Road
from pyOpenDRIVE.CubicSpline import PyCubicSpline
from pyOpenDRIVE.CubicSpline cimport PyCubicSpline
from pyOpenDRIVE.RefLine import PyRefLine
from pyOpenDRIVE.RefLine cimport PyRefLine

cdef class PyCrossfall:
    def __cinit__(self):
        self.c_self = make_shared[Crossfall]()

    def get_crossfall(self, const double s, const bool on_left_side):
        return self.unwrap().get_crossfall(s, on_left_side)

    @property
    def sides(self):
        return self.unwrap().sides

cdef class PyRoadLink:
    def __cinit__(self, string id = "", int type = 0, int contact_point = 0):
        if id != "":
            self.c_self = make_shared[RoadLink](id, <RoadLink.Type>type, <RoadLink.ContactPoint>contact_point)
        else:
            self.c_self = make_shared[RoadLink]()

    @property
    def id(self):
        return self.unwrap().id

    @property
    def type(self):
        return <int>self.unwrap().type

    @property
    def contact_point(self):
        return <int>self.unwrap().contact_point

cdef class PyRoadNeighbor:
    def __cinit__(self, string id = "", string side = "", string direction = ""):
        if id != "":
            self.c_self = make_shared[RoadNeighbor](id, side, direction)

    @property
    def id(self):
        return self.unwrap().id

    @property
    def side(self):
        return self.unwrap().side

    @property
    def direction(self):
        return self.unwrap().direction

cdef class PyRoad:
    def __cinit__(self, string id = "", double length = 0, string junction = "", string name = "", bool left_hand_traffic = False):
        if id != "":
            self.c_self = make_shared[Road](id, length, junction, name, left_hand_traffic)

    @property
    def length(self):
        return self.unwrap().length

    @property
    def id(self):
        return self.unwrap().id

    @property
    def junction(self):
        return self.unwrap().junction

    @property
    def name(self):
        return self.unwrap().name

    @property
    def left_hand_traffic(self):
        return self.unwrap().left_hand_traffic

    @property
    def predecessor(self):
        return PyRoadLink.wrap(self.unwrap().predecessor)

    @property
    def successor(self):
        return PyRoadLink.wrap(self.unwrap().successor)

    @property
    def neighbors(self):
        out_arr = []
        cdef vector[RoadNeighbor] c_objs = self.unwrap().neighbors
        for i in range(c_objs.size()):
            out_val = PyRoadNeighbor.wrap(c_objs[i])
            out_arr.append(out_val)
        return out_arr

    @property
    def lane_offset(self):
        return PyCubicSpline.wrap(self.unwrap().lane_offset)

    @property
    def superelevation(self):
        return PyCubicSpline.wrap(self.unwrap().superelevation)

    @property
    def crossfall(self):
        return PyCrossfall.wrap(self.unwrap().crossfall)

    @property
    def ref_line(self):
        return PyRefLine.wrap(self.unwrap().ref_line)