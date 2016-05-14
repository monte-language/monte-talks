EPSILON = 1.0 / (1 << 20)

def cube(a):
    "Cube root using Newton's method."

    x = a / 3.0
    while (abs(x ** 3 - a) > EPSILON):
        print "cube", a, x, x ** 3 - a
        x = ((a / (x * x)) + 2 * x) / 3.0
    return x

if __name__ == "__main__":
    import sys
    c = cube(float(sys.argv[1]))
    print c, c ** 3
