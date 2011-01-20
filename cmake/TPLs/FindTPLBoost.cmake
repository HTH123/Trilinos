INCLUDE(TPLDeclareLibraries)

TPL_DECLARE_LIBRARIES( Boost
  REQUIRED_HEADERS boost/version.hpp boost/mpl/at.hpp
  REQUIRED_LIBS_NAMES "program_options"
  )

# This broke trilinos configuration:
#  REQUIRED_LIBS_NAMES "program_options"

# NOTE: For the time being, please do not put in *any* library dependeices for
# boost as many people are only installing the headers for boost and currently
# all Trilinos packages that use this TPL are only relying on headers.  The
# addition of REQUIRED_LIBS_NAMES will break *many* Trilinos builds, including
# many nightly builds.  If you want to access compiled Boost libraries in your
# Trilinos package please add the CMake logic in your package's CMakeLists.txt
# files to handle that on your own for now.  The issue of how to deal with
# Boost compiled libraries needs to be worked out inside the Trilinos
# development team.
