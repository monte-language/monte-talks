exports (main)

def main(_) as DeepFrozen:
    def seq := [null, 1, 1].diverge()
    def q(n :Int) :Int:
        var next :Int := seq.size()
        while (n >= next):
            seq.push(seq[next - seq[next - 1]] + seq[next - seq[next - 2]])
            next += 1
        return seq[n]
    traceln(`[for i in (1..10) q(i)] == ${[for i in (1..10) q(i)]}`)
    traceln(`q(1_000) == ${q(1_000)}`)
    traceln(`q(100_000) == ${q(100_000)}`)
    return 0
