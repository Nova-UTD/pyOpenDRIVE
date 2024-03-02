# distutils: language=c++

from pyOpenDRIVE cimport XmlNode

cdef class PyXmlNode:
    def __cinit__(self):
        self.c_self = make_shared[XmlNode]()