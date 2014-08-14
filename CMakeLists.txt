project(mruby-toy)
cmake_minimum_required(VERSION 2.8)


# aux_source_directory(./src SRC_LIST)
add_executable(${PROJECT_NAME} jade.c jade.h)
add_definitions( -Wall -g )
