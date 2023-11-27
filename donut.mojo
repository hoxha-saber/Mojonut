from memory import memset
from memory.unsafe import Pointer
import math as m
from utils.static_tuple import StaticTuple
from time import sleep

fn main():
    var A : Float32 = 0
    var B : Float32 = 0
    var i : Float32 = 0
    var j : Float32 = 0
    var z = StaticTuple[1760, Float32]()
    var b = StaticTuple[1760, UInt8]()
    let chars = StringRef(".,-~:;=!*#$@")
    var outstr = DynamicVector[Int](12)
    for i in range(len(chars)):
        outstr[i] = ord(chars[i])

    print("\x1b[2J")
    while True:
        for i in range(1760):
            z[i] = 0
            b[i] = 32
        j = 0
        while j < 6.28:
            i = 0
            while i < 6.28:
                let c = m.sin(i)
                let d = m.cos(j)
                let e = m.sin(A)
                let f = m.sin(j)
                let g = m.cos(A)
                let h = d + 2
                let D = 1 /(c * h * e * f * g + 5)
                let l = m.cos(i)
                let m_ = m.cos(B)
                let n = m.sin(B)
                let t = c * h * g - f * e
                let x  = (40 + 30 * D * (l * h * m_ - t * n)).cast[DType.int32]()
                let y = (12 + 15 * D * (l * h * n + t * m_)).cast[DType.int32]()
                let o : Int = (x + (80 * y)).to_int()
                let N = (8 * ((f * e - c * d * g) * m_ - c * d * e - f * g - l * d * n)).cast[DType.int32]()
                if (SIMD[DType.int32, 1](22) > y) and (y > 0) and (x > 0) and (SIMD[DType.int32, 1](80) > x) and (D > z[o]):
                    z[o] = D
                    if N > 0:
                        b[o] = outstr[N.to_int()]
                    else:
                        b[o] = outstr[0]
                i += 0.02
            j += 0.07
        print("\x1b[H")
        for k in range(1761):
            let line_feed = chr(10)
            let char_to_print = chr(b[k].to_int())
            if (k % 80):
                print_no_newline(char_to_print)
            else:
                print_no_newline(line_feed)
            A += 0.00004
            B += 0.00002
        sleep(0.03)