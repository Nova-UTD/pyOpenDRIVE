# distutils: language=c++

cdef extern from "../src/RefLine.cpp" namespace "odr":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr, unique_ptr

from pyOpenDrive.Math cimport Vec3D, Line3D
from pyOpenDrive.CubicSpline cimport CubicSpline
from pyOpenDrive.RoadGeometry cimport RoadGeometry

cdef extern from "RefLine.h" namespace "odr":
    cdef cppclass RefLine:
        RefLine(string road_id, length) except +
        RefLine(const RefLine& other) except +

        set[const RoadGeometry*] get_geometries() const
        set[RoadGeometry*] get_geometries()

        double get_geometry_s0(const double s) const
        const RoadGeometry* get_geometry(const double s) const
        RoadGeometry* get_geometry(const double s)

        Vec3D get_xyz(const double s) const
        Vec3D get_grad(const double s) const
        Line3D get_line(const double s_start, const double s_end, const double eps) const
        double match(const double x, const double y) const
        set[double] approximate_linear(const double eps, const double s_start, const double s_end) const

        string road_id
        double length
        CubicSpline elevation_profile

        map[double, unique_ptr[RoadGeometry]] s0_to_geometry

cdef class PyRefLine:
    cdef shared_ptr[RefLine] c_self