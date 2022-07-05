package main
    
import "core:fmt"

is_digit :: proc(char: rune) -> (bool) {
    if char < '0' || char > '9' { return false } return true
}

is_int :: proc(input: string) -> (bool) {
    if len(input) < 1 { return false }

    for char in input {
        if is_digit(char) { return false }
    }

    return true
}

is_float :: proc(input: string) -> (bool) {
    if len(input) < 2 { return false }

    decimalDetected: bool = false

    for char in input {
        if is_digit(char) {
            if char == '.' && decimalDetected {
                return false
            } else {
                decimalDetected = true
            }
        }
    }

    return true;
}

main :: proc() {
    fmt.println(is_float(".7"))
}
