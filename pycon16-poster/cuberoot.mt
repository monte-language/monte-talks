exports (main)

def EPSILON :Double := 1 / (1 << 20)

def cube(a :Double) :Double as DeepFrozen:
    "Cube root using Newton's method."

    var x := a / 3.0
    while ((x ** 3 - a).abs() > EPSILON):
        traceln(`cube $a $x ${x ** 3 - a}`)
        x := ((a / (x * x)) + 2 * x) / 3.0
    return x

def main(argv) as DeepFrozen:
    def d :Double := _makeDouble(argv[0])
    def c :Double := cube(d)
    traceln([c, c ** 3])
