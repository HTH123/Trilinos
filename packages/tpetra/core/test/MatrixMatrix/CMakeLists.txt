# FIXME (mfh 27 Sep 2015) The test actually uses GO = int.  We should
# just make the test independent of the particular GO value -- it
# shouldn't matter, since the test cases are small.
IF (Tpetra_INST_INT_LONG AND Tpetra_INST_INT_INT)
TRIBITS_ADD_EXECUTABLE_AND_TEST(
  MatrixMatrix_UnitTests
  SOURCES 
    MatrixMatrix_UnitTests.cpp
    ${TEUCHOS_STD_UNIT_TEST_MAIN}
  ARGS "--matnames-file=\"matrixsystems.xml\" --v"
)

TRIBITS_COPY_FILES_TO_BINARY_DIR(TpetraMatMatFileCopies
DEST_FILES
cdt_m.mtx cdt_tce.mtx cdt_d.mtx
syn1a.mtx syn1b.mtx syn1c.mtx 
synTa.mtx synTb.mtx synTc.mtx
synBTa.mtx synBTb.mtx synBTc.mtx
synATa.mtx synATb.mtx synATc.mtx
synRecta.mtx synRectb.mtx synRectc.mtx
synadd1a.mtx synadd1b.mtx synadd1c.mtx
smallBTa.mtx smallBTb.mtx smallBTc.mtx
smallAdda.mtx smallAddb.mtx smallAddc.mtx
smallATa.mtx smallATb.mtx smallATc.mtx
rectAPa.mtx rectAPb.mtx rectAPc.mtx
rectRAa.mtx rectRAb.mtx rectRAc.mtx
rectRPa.mtx rectRPb.mtx rectRPc.mtx
rectQPa.mtx rectQPb.mtx rectQPc.mtx
rectQRa.mtx rectQRb.mtx rectQRc.mtx
rectTransAdda.mtx rectTransAddb.mtx rectTransAddc.mtx
rectAtransIa.mtx rectAtransIb.mtx rectAtransIc.mtx
smallRectAIa.mtx smallRectAIb.mtx smallRectAIc.mtx
denserATa.mtx denserATc.mtx
SOURCE_DIR ${PACKAGE_SOURCE_DIR}/test/MatrixMatrix/matrices
DEST_DIR ${PACKAGE_BINARY_DIR}/test/MatrixMatrix/matrices
EXEDEPS MatrixMatrix_UnitTests
)

TRIBITS_COPY_FILES_TO_BINARY_DIR(TpetraMatMatSystemFileCopy
DEST_FILES
matrixsystems.xml
SOURCE_DIR ${PACKAGE_SOURCE_DIR}/test/MatrixMatrix
EXEDEPS MatrixMatrix_UnitTests
)
ENDIF()


