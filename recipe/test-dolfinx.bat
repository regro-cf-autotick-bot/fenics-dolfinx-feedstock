setlocal EnableDelayedExpansion
@echo on

:: pip check
:: if errorlevel 1 exit 1

:: test packaging
:: pytest -vs test_dolfinx.py
:: if errorlevel 1 exit 1

:: exercise a demo
:: cd python/demo
:: pytest --mpiexec=mpiexec -vs -k demo_poisson test.py
:: if errorlevel 1 exit 1
:: cd ../test

:: run some tests
:: subset of tests should exercise dependencies, solvers, partitioners
set TESTS="unit/fem/test_fem_pipeline.py unit/mesh/test_mesh_partitioners.py"
pytest -vs %TESTS%
if errorlevel 1 exit 1

mpiexec -n 2 pytest -vs %TESTS%
if errorlevel 1 exit 1

