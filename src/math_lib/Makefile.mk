$(OBJ_DIR)/math_lib.o: $(MATH_LIB_SRC_DIR)/math_utils.c $(MATH_LIB_SRC_DIR)/math_utils.h | $(OBJ_DIR)
	$(CC) -I$(MATH_LIB_SRC_DIR) $(CFLAGS) -c $< -o $@

$(LIB_DIR)/math_lib.a: $(OBJ_DIR)/math_lib.o | $(LIB_DIR)
	$(AR) $(ARFLAGS) $@ $^
	ranlib $@
