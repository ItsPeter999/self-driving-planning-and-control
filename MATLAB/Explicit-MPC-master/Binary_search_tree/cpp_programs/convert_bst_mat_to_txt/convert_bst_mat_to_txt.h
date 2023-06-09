//Header file with struct specification

#ifndef CONVERT_BST_MAT_TO_TXT_H
#define CONVERT_BST_MAT_TO_TXT_H

//Necessary Include
#include "C:\Users\schul\Documents\UDESC\TCC\TCC1\Programas MATLAB\GitHub\Explicit-MPC\Binary_search_tree\cpp_programs\explicit_mpc_bst\explicit_mpc_bst.h"
#include "C:\Users\schul\Documents\UDESC\TCC\TCC1\Programas MATLAB\GitHub\Explicit-MPC\Binary_search_tree\cpp_programs\convert_bst_mat_to_txt\mat.h"
#include <iostream>
#include <vector>

void write_double_to_file(double *element, std::ifstream *file);

void write_int_to_file(int *element, std::ifstream *file);

void get_struct_bst_from_mat(struct_control_param *control_param, std::vector<struct_bst> *bst_nodes, const char *filename);

void get_struct_regions_from_mat(struct_control_param *control_param, std::vector<struct_regions> *regions, const char *filename);

void get_struct_ineq_from_mat(struct_control_param *control_param, std::vector<struct_ineq_set> *ineq_set, const char *filename);

void export_regions_to_file(struct_control_param *control_param, std::vector<struct_regions> *regions, const char *filename);

void export_bst_to_file(struct_control_param *control_param, std::vector<struct_bst> *bst_nodes, const char *filename);

void export_ineq_set_to_file(struct_control_param *control_param, std::vector<struct_ineq_set> *ineq_set, const char *filename);

void export_control_param_to_file(struct_control_param *control_param, const char *filename);

#endif
