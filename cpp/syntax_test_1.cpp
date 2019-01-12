#include <iostream>
#include "myheader"
// ^ ppc ^^^^^^^^^^ pps       1)

int main() {
//  ^^^^ kwd                  2)
/* comment comment comment
 * <  com  ^ com  ^ com      3)
 */

    int var =   0x1234;
/*      ^^^ std ^    ^ num */
//          ^ opt             4)
    std::cout << "whatever: " << var <<   "\n";
//               ^^^^^^^^^^^^ str    ^^opt ^^ esc
//             ^ opt                      ^  ^ str
//               ^^^^^^^^^^^^ str    ^^opt ^^ esc
//             ^ opt                      ^  ^ str
//               ^^^^^^^^^^^^ str    ^^opt ^^ esc
//             ^ opt                      ^  ^ str

    return 0;
    //  <   kwa               5)
}
