# distutils: language=c++

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "Geometries/CubicSpline.h" namespace "odr":
    cdef cppclass XmlNode:
        xml_node xml_node

cdef class PyXmlNode:
    cdef shared_ptr[XmlNode] c_self