# distutils: language=c++

from libcpp.vector cimport vector
from pyOpenDrive.Array cimport array

cdef extern from "Math.hpp" namespace "odr":
    ctypedef int dim_3 "3"
    ctypedef int dim_2 "2"

    ctypedef array[double, dim_2] Vec2D
    ctypedef array[double, dim_3] Vec3D
    ctypedef vector[Vec3D] Line3D