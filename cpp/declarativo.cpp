#include <iostream>

enum class OperationType { ADD, SUB, DIV, MUL };

class Solver {

public:
  Solver() = default;

  template <typename T> T resolve(T x, T y) { return x / y; };
};

int main() {

  Solver solver;

  auto result = solver.resolve(5.0, 2.0);

  std::cout << "Result: " << result << std::endl;

  return 0;
}