from setuptools import setup

from Cython.Build import cythonize

#setup(ext_modules=cythonize(["PyOpenDRIVE/*.pyx"]))
setup(ext_modules=cythonize(["PyOpenDRIVE/Lane.pyx"]))