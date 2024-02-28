# distutils: language=c++

cdef extern from "pugixml/pugixml.cpp" namespace "pugi":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "pugixml/pugixml.hpp" namespace "pugi":
    cdef cppclass xml_node

cdef extern from "XmlNode.h" namespace "odr":
    cdef cppclass XmlNode:
        xml_node xml_node

cdef class PyXmlNode:
    cdef shared_ptr[XmlNode] c_self