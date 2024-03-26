# distutils: language=c++

from pyOpenDRIVE cimport XmlNode

cdef class PyXmlNode:
    def __cinit__(self):
        self.c_self = make_shared[XmlNode]()

cdef class PyXmlDocument:
    def __cinit__(self):
        self.c_self = make_shared[xml_document]()

    def empty(self):
        return self.unwrap().empty();

    def type(self):
        return self.unwrap().type();
    def name(self):
        return <string>self.unwrap().name();
    def value(self):
        return <string>self.unwrap().value();