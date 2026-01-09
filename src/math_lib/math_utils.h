#ifndef MATH_UTILS_H
#define MATH_UTILS_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stdio.h"
#include "stdlib.h"

int add(int a, int b);
int divide(int a, int b);
int is_positive(int x);
const char *get_sign_name(int x);
double compute_ratio(int a, int b);

#ifdef __cplusplus
}
#endif

#endif
