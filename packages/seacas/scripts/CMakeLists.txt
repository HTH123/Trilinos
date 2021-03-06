INCLUDE(TribitsAddExecutable)
INCLUDE(TribitsLibraryMacros)

SET( ACCESSDIR ${CMAKE_INSTALL_PREFIX} )
SET( SEPARATOR "_")

ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASNemspread)
ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASNemslice)
IF (${PROJECT_NAME}_ENABLE_SEACASNemspread AND ${PROJECT_NAME}_ENABLE_SEACASNemslice)
  CONFIGURE_FILE(
	${CMAKE_CURRENT_SOURCE_DIR}/decomp.in
	${CMAKE_CURRENT_BINARY_DIR}/decomp
	@ONLY
	)
  INSTALL(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/decomp DESTINATION bin)
ENDIF()

ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASBlot)
IF (${PROJECT_NAME}_ENABLE_SEACASBlot)
  CONFIGURE_FILE(
	${CMAKE_CURRENT_SOURCE_DIR}/blot.in
	${CMAKE_CURRENT_BINARY_DIR}/blot
	@ONLY
	)
  INSTALL(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/blot DESTINATION bin)
ENDIF()

ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASFastq)
IF (${PROJECT_NAME}_ENABLE_SEACASFastq)
  CONFIGURE_FILE(
	${CMAKE_CURRENT_SOURCE_DIR}/fastq.in
	${CMAKE_CURRENT_BINARY_DIR}/fastq
	@ONLY
	)
  INSTALL(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/fastq DESTINATION bin)
ENDIF()

ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASEpu)
IF (${PROJECT_NAME}_ENABLE_SEACASEpu)
  CONFIGURE_FILE(
	${CMAKE_CURRENT_SOURCE_DIR}/epup.in
	${CMAKE_CURRENT_BINARY_DIR}/epup
	@ONLY
	)
  INSTALL(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/epup DESTINATION bin)
ENDIF()

INCLUDE_DIRECTORIES(
  "${CMAKE_CURRENT_SOURCE_DIR}"
)

SET(HEADERS "")
APPEND_GLOB(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/getopt.seacas.c)

ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASBlot)
ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASFastq)
ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASEpu)
IF (${PROJECT_NAME}_ENABLE_SEACASBlot OR 
    ${PROJECT_NAME}_ENABLE_SEACASFastq OR
    ${PROJECT_NAME}_ENABLE_SEACASEpu)
   ADD_EXECUTABLE(getopt.seacas ${SOURCES}	)
   install_executable(getopt.seacas)
endif()

ASSERT_DEFINED(${PROJECT_NAME}_ENABLE_SEACASExodus)
ASSERT_DEFINED(BUILD_SHARED_LIBS)
IF (${PROJECT_NAME}_ENABLE_SEACASExodus)
   CONFIGURE_FILE(
   	${CMAKE_CURRENT_SOURCE_DIR}/exodus.py.in
	${CMAKE_CURRENT_BINARY_DIR}/exodus.py
	@ONLY
   )	
   INSTALL(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/exodus.py DESTINATION lib)
endif()

