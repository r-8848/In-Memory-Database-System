CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -O2 -pthread
LDFLAGS = -pthread

# Source files
SERVER_SRCS = server.cpp hash_map.cpp avl_tree.cpp sorted_set.cpp min_heap.cpp thread_pool.cpp
CLIENT_SRCS = client.cpp

# Object files
SERVER_OBJS = $(SERVER_SRCS:.cpp=.o)
CLIENT_OBJS = $(CLIENT_SRCS:.cpp=.o)

# Targets
all: redis-server redis-client test-avl test-heap test-offset

redis-server: $(SERVER_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

redis-client: $(CLIENT_OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

test-avl: tests_avl.cpp avl_tree.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

test-heap: tests_heap.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS)

test-offset: tests_offset.cpp avl_tree.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: test-avl test-heap test-offset
	./test-avl
	./test-heap
	./test-offset
	@echo "All unit tests passed!"

clean:
	rm -f $(SERVER_OBJS) $(CLIENT_OBJS) redis-server redis-client test-avl test-heap test-offset
	rm -f server.o hashtable.o avl.o zset.o heap.o client.o server client test_avl test_heap test_offset

.PHONY: all clean test 