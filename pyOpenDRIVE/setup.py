from setuptools import setup

from Cython.Build import cythonize

setup(ext_modules=cythonize(["OpenDriveMap.pyx"]), include_dirs=["./include"])