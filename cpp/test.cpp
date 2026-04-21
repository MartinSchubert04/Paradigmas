#include <iostream>
#include <thread>

static int nt = 10;

void printT(int i) { std::cout << "Thread number: " << i << std::endl; }

int main() {
  std::thread t[nt];

  for (int i = 0; i < nt; i++) {
    t[i] = std::thread(printT, i);
  }

  for (int i{0}; i < nt; i++) {
    t[i].join();
  }

  return 0;
}