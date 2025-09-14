# In-Memory Database System  

This project is a Redis-like in-memory database implemented in **C++**. It provides fast data access, efficient indexing, TTL-based key expiration, and scalable concurrency handling for client-server communication.  

---

## Features  

- **Key-Value Storage**: Fast insertion and retrieval using hashmaps.  
- **Sorted Sets**: Implemented with AVL trees to support ordered operations.  
- **TTL Management**: Min-heaps handle automatic expiration of keys.  
- **Client-Server Communication**: TCP sockets ensure seamless interaction between server and clients.  
- **Scalability**: Thread pools and event loops improve responsiveness under high load.  

---

## Tech Stack  

- **Language**: C++  
- **Networking**: TCP sockets  
- **Data Structures**: Hashmaps, AVL trees, Min-heaps  
- **Concurrency**: Thread pools, Event-driven architecture  

---

## Conclusion  

This project demonstrates the design of a lightweight, Redis-inspired in-memory database built in C++.  
It focuses on **performance, scalability, and efficient memory management**, making it a solid learning exercise in systems programming and database internals.  
