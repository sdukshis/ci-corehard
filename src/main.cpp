#include <iostream>

#include <hello/hello.h>

using std::cout;
using std::endl;
using hello::greetings;

int main() {
    greetings(cout) << endl;
}
