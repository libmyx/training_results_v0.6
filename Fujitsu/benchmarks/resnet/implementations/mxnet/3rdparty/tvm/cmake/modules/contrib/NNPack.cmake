if(USE_NNPACK)
  if(NNPACK_PATH STREQUAL "")
    set(NNPACK_PATH ${CMAKE_CURRENT_SOURCE_DIR}/NNPack)
  endif()
	set(PTHREAD_POOL_PATH ${NNPACK_PATH}/deps/pthreadpool)
  file(GLOB NNPACK_CONTRIB_SRC src/contrib/nnpack/*.cc)
  list(APPEND RUNTIME_SRCS ${NNPACK_CONTRIB_SRC})
	include_directories(${NNPACK_PATH}/include)
	include_directories(${PTHREAD_POOL_PATH}/include)
    find_library(NNPACK_CONTRIB_LIB nnpack ${NNPACK_PATH}/lib)
  find_library(NNPACK_PTHREAD_CONTRIB_LIB pthreadpool ${NNPACK_PATH}/lib)
  list(APPEND TVM_RUNTIME_LINKER_LIBS ${NNPACK_CONTRIB_LIB})
  list(APPEND TVM_RUNTIME_LINKER_LIBS ${NNPACK_PTHREAD_CONTRIB_LIB})
endif(USE_NNPACK)