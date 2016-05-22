import "lib/codec/utf8" =~ [=> UTF8 :DeepFrozen]
import "lib/gai" =~ [=> makeGAI :DeepFrozen]
import "http/client" =~ [=> makeRequest :DeepFrozen]
exports (main)

def main(argv, => getAddrInfo, => makeTCP4ClientEndpoint) as DeepFrozen:
    def addrs := getAddrInfo(b`example.com`, b``)
    return when (addrs) ->
        def gai := makeGAI(addrs)
        def [addr] + _ := gai.TCP4()
        def response := makeRequest(makeTCP4ClientEndpoint, addr.getAddress(),
                                    "/").get()
        when (response) ->
            traceln(response)
            traceln(UTF8.decode(response.body(), null))
            0
