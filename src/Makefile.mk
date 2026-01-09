$(OBJ_DIR)/helloworld_cpp.o: $(MAIN_SRC_DIR)/helloworld_cpp.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BIN_DIR)/helloworld_cpp: $(OBJ_DIR)/helloworld_cpp.o | $(BIN_DIR)
	$(CXX) $(LDFLAGS) $^ -o $@

$(OBJ_DIR)/main.o: $(MAIN_SRC_DIR)/main.c $(MATH_LIB_SRC_DIR)/math_utils.h | $(OBJ_DIR)
	$(CC) -I$(MATH_LIB_SRC_DIR) $(CFLAGS) -c $< -o $@

$(BIN_DIR)/main: $(OBJ_DIR)/main.o $(LIB_DIR)/math_lib.a | $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ -o $@
