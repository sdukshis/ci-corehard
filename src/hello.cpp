#include <hello/hello.h>

namespace hello {

std::ostream& greetings(std::ostream& stream) {
    return stream << "Hello, corehard";
}

}