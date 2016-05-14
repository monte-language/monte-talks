def cube(a):
    "Cube root using Newton's method."

    x = a / 3.0
    for _ in range(9):
        print "cube", a, x
        x = ((a / (x * x)) + 2 * x) / 3.0
    return x

if __name__ == "__main__":
    c = cube(9.5)
    print c, c ** 3
