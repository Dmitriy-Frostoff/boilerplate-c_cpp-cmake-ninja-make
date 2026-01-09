#include "./math_utils.h"

int add(int a, int b) { return a + b; }

int divide(int a, int b) {
  if (b == 0) {
    fprintf(
        stderr,
        "(%s function at line %d): param 'b' is zero. Division by zero error",
        __func__, __LINE__);
    exit(1);
  }

  return a / b;
}

int is_positive(int x) { return x > 0; }

const char *get_sign_name(int x) {
  if (x > 0) {
    return "positive";
  }

  if (x < 0) {
    return "negative";
  }

  return "zero";
}

double compute_ratio(int a, int b) {
  if (b == 0) {
    return (double)0;
  }

  return (double)a / (double)b;
}
