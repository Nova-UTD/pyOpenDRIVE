# distutils: language=c++

cdef extern from "../src/Mesh.cpp" namespace "odr":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "<cstdint>" namespace "std":
    cdef cppclass uint32_t

from pyOpenDrive.Array cimport array
from pyOpenDrive.Math cimport Vec3D, Line3D, Vec2D

cdef extern from "Mesh.h" namespace "odr":
    cdef cppclass Mesh3D:
        Mesh3D() except +

        void add_mesh(const Mesh3D& other)
        string get_obj() const

        vector[Vec3D] vertices
        vector[uint32_t] indices
        vector[Vec3D] normals
        vector[Vec2D] st_coordinates

cdef class PyMesh3D:
    cdef shared_ptr[Mesh3D] c_self