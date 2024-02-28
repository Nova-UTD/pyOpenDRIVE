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

cdef extern from "Mesh.h" namespace "odr":
    ctypedef int dim_3 "3"
    ctypedef int dim_2 "2"

    ctypedef array[double, dim_2] Vec2D
    ctypedef array[double, dim_3] Vec3D

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