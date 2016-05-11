def undot(specimen):
    "Recursively re-add structure by undoing dots.

     undot([\"first.second\" => \"third\"]) ==
     [\"first\" => [\"second\" => \"third\"]]"

    return switch (specimen):
        match m :Map:
            var newMap := [].asMap()
            for k => v in m:
                if (k =~ `@head.@tail`):
                    def values := newMap.fetch(head, fn {[].asMap()})
                    newMap with= (head, values.with(tail, v))
                else:
                    newMap with= (k, v)
            # And recurse.
            [for k => v in (newMap) k => undot(v)]
        match l :List:
            [for x in (l) undot(x)]
        match _:
            specimen

traceln(undot(["first.second" => "third"]))
