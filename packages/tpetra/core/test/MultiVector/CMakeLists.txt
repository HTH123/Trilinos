TRIBITS_ADD_EXECUTABLE_AND_TEST(
  MultiVector_UnitTests
  SOURCES
    MultiVector_UnitTests
    ${TEUCHOS_STD_UNIT_TEST_MAIN}
  COMM serial mpi
  STANDARD_PASS_OUTPUT
  ${MAXNP}
  )

# This test comes from zoltan2/test/temp/multivectorTest.cpp.  It
# mimics the recursive bisection algorithm in Zoltan2, and times data
# migration.
#
# The test itself does not refer to MPI.  Hoewver, it only makes sense
# to run this test in an MPI build.  Otherwise, no data migration is
# necessary.
TRIBITS_ADD_EXECUTABLE_AND_TEST(
  rcb
  SOURCES rcb.cpp ${MV_RCB_OBJECTS_CUDA}
  COMM mpi
  STANDARD_PASS_OUTPUT
  ${MAXNP}
  )
