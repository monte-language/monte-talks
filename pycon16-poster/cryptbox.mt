exports (main)

def main(argv, => currentRuntime, => makeFileResource) as DeepFrozen:
    def getFile(path :Str):
        return makeFileResource(path)<-getContents()

    def setFile(path :Str, bs :Bytes):
        return makeFileResource(path)<-setContents(bs)

    def keyMaker := currentRuntime.getCrypt().keyMaker()
    return switch (argv):
        match [=="makeKey", keyPath]:
            def [_, secretKey] := keyMaker()
            def secretBytes :Bytes := secretKey.asBytes()
            when (setFile(keyPath, secretBytes)) -> {0}
        match [=="seal", keyPath, plainPath, cipherPath, noncePath]:
            def secretBytes := getFile(keyPath)
            def plainBytes := getFile(plainPath)
            when (secretBytes, plainBytes) ->
                def secretKey := keyMaker.fromSecretBytes(secretBytes)
                def pair := secretKey.pairWith(secretKey.publicKey())
                def [cipherBytes, nonceBytes] := pair.seal(plainBytes)
                when (setFile(cipherPath, cipherBytes),
                      setFile(noncePath, nonceBytes)) -> {0}
        match [=="unseal", keyPath, cipherPath, noncePath, plainPath]:
            def secretBytes := getFile(keyPath)
            def cipherBytes := getFile(cipherPath)
            def nonceBytes := getFile(noncePath)
            when (secretBytes, cipherBytes, nonceBytes) ->
                def secretKey := keyMaker.fromSecretBytes(secretBytes)
                def pair := secretKey.pairWith(secretKey.publicKey())
                def plainBytes := pair.unseal(cipherBytes, nonceBytes)
                when (setFile(plainPath, plainBytes)) -> {0}
