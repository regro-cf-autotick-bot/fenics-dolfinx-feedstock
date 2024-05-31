setlocal EnableDelayedExpansion
@echo on

set "CXXFLAGS=%CXXFLAGS% -DH5_BUILT_AS_DYNAMIC_LIB"

set "SKBUILD_CMAKE_ARGS=-DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%;-DCMAKE_TOOLCHAIN_FILE=%RECIPE_DIR%\impi-toolchain.cmake"
set PIP_DISABLE_PIP_VERSION_CHECK=1

echo CXXFLAGS=!CXXFLAGS!
echo CMAKE_ARGS=!CMAKE_ARGS!
echo SKBUILD_CMAKE_ARGS=!SKBUILD_CMAKE_ARGS!

%PYTHON% -m pip install -v --no-deps --no-build-isolation ./python --config-settings=cmake.verbose=true --config-settings=logging.level=DEBUG
if errorlevel 1 exit 1
