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
    cdef cppclass char_t

    cdef enum xml_node_type:
        node_null,
        node_document,
        node_element,
        node_pcdata,
        node_cdata,
        node_comment,
        node_pi,
        node_declaration,
        node_doctype

    # NOTE: Partially wrapped, may not need to be wrapped fully
    cdef cppclass xml_node:
        xml_node() except +

        bool operator==(const xml_node& r) const
        bool operator!=(const xml_node& r) const
        bool operator<(const xml_node& r) const
        bool operator>(const xml_node& r) const
        bool operator<=(const xml_node& r) const
        bool operator>=(const xml_node& r) const
        
        bool empty() const

        xml_node_type type() const
        const char_t* name() const
        const char_t* value() const

cdef extern from "XmlNode.h" namespace "odr":
    cdef cppclass XmlNode:
        xml_node node "xml_node"

cdef class PyXmlNode:
    cdef shared_ptr[XmlNode] c_self