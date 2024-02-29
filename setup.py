from setuptools import setup

from Cython.Build import cythonize

#setup(ext_modules=cythonize(["pyOpenDRIVE/*.pyx"]))
setup(ext_modules=cythonize(["pyOpenDRIVE/Road.pyx"]), include_dirs=["pyOpenDRIVE/include"])