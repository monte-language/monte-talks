def main():
    seq = [None, 1, 1]
    def q(n):
        next = len(seq)
        while n >= next:
            seq.append(seq[next - seq[next - 1]] + seq[next - seq[next - 2]])
            next += 1
        return seq[n]
    print "[q(i) for i in range(1, 11)] ==", [q(i) for i in range(1, 11)]
    print "q(1000) ==", q(1000)
    print "q(100000) ==", q(100000)

main()
