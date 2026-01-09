#include "./math_lib/math_utils.h"

int main(void) {
  printf("add function: add(40, 2) => %d\n", add(40, 2));
  printf("divide function: divide(42, 2) => %d\n", divide(42, 2));
  printf("is_positive function: is_positive(-42) => %d\n", is_positive(-42));
  printf("get_sign_name function: get_sign_name(-42) => %s\n",
         get_sign_name(-42));
  printf("compute_ratio function: compute_ratio() => %.4f\n",
         compute_ratio(42, 2));
  printf("result: %d\n", divide(1, 0));

  return 0;
}
