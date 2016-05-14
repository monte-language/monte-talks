def undot(specimen):
    """
    Recursively re-add structure by undoing dots.

    undot({"first.second": "third"}) == {"first": {"second": "third"}}
    """

    if isinstance(specimen, dict):
        newDict = {}
        for (k, v) in specimen.iteritems():
            if '.' in k:
                head, tail = k.split('.', 1)
                values = newDict.get(head, {}).copy()
                values[tail] = v
                newDict[head] = values
            else:
                newDict[k] = v
        # And recurse.
        return {k: undot(v) for (k, v) in newDict.iteritems()}
    elif isinstance(specimen, list):
        return [undot(x) for x in specimen]
    else:
        return specimen

print undot({"first.second": "third"})
