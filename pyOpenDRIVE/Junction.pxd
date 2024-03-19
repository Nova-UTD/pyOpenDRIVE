# distutils: language=c++

cdef extern from "../src/Junction.cpp":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr

from pyOpenDRIVE.XmlNode cimport XmlNode

cdef extern from "<cstdint>" namespace "std":
    cdef cppclass uint32_t

cdef extern from "Junction.h" namespace "odr":

    cdef cppclass JunctionLaneLink:
        JunctionLaneLink(int f, int to) except +

        int f "from" # Workaround here, since having a field or variable named "from" causes cython to throw syntax errors...
        int to

    cdef cppclass JunctionConnection:
        enum ContactPoint:
            ContactPoint_None,
            ContactPoint_Start,
            ContactPoint_End
        
        JunctionConnection(string id, string incoming_road, string connecting_road, ContactPoint contact_point) except +

        string id
        string incoming_road
        string connecting_road
        ContactPoint contact_point

        set[JunctionLaneLink] lane_links

    cdef cppclass JunctionPriority:
        JunctionPriority(string high, string low) except +

        string high
        string low
    
    cdef cppclass JunctionController:
        JunctionController(string id, string type, uint32_t sequence) except +

        string id
        string type
        uint32_t sequence

    cdef cppclass Junction(XmlNode):
        Junction(string name, string id) except +

        string name
        string id

        map[string, JunctionConnection] id_to_connection
        map[string, JunctionController] id_to_controller
        set[JunctionPriority] priorities

cdef class PyJunction:
    @staticmethod
    cdef inline PyJunction wrap(const Junction& c_obj):
        temp = PyJunction()
        temp.c_self = make_shared[Junction](c_obj)
        return temp

    cdef inline Junction* unwrap(this):
        return this.c_self.get()
        
    cdef shared_ptr[Junction] c_self