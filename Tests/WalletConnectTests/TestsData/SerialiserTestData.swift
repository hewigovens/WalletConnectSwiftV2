// 

import Foundation
@testable import WalletConnect

enum SerialiserTestData {
    static let emptyAgreementKeys = Crypto.X25519.AgreementKeys(sharedSecret: Data(hex: ""), publicKey: Data(hex: ""))
    static let iv = Data(hex: "f0d00d4274a7e9711e4e0f21820b8877")
    static let publicKey = Data(hex: "45c59ad0c053925072f4503a39fe579ca8b7b8fa6bf0c7297e6db8f6585ee77f")
    static let mac = Data(hex: "fc6d3106fa827043279f9db08cd2e29a988c7272fa3cfdb739163bb9606822c7")
    static let cipherText =
        Data(hex: "14aa7f6034dd0213be5901b472f461769855ac1e2f6bec6a8ed1157a9da3b2df08802cbd6e0d030d86ff99011040cfc831eec3636c1d46bfc22cbe055560fea3")
    static let serialisedMessage = "f0d00d4274a7e9711e4e0f21820b887745c59ad0c053925072f4503a39fe579ca8b7b8fa6bf0c7297e6db8f6585ee77ffc6d3106fa827043279f9db08cd2e29a988c7272fa3cfdb739163bb9606822c714aa7f6034dd0213be5901b472f461769855ac1e2f6bec6a8ed1157a9da3b2df08802cbd6e0d030d86ff99011040cfc831eec3636c1d46bfc22cbe055560fea3"
    static let pairingApproveJSONRPCRequest = ClientSynchJSONRPC(id: 0,
                                                                 jsonrpc: "2.0",
                                                                 method: ClientSynchJSONRPC.Method.pairingApprove,
                                                                 params: ClientSynchJSONRPC.Params.pairingApprove(
                                                                    PairingType.ApproveParams(relay: RelayProtocolOptions(protocol: "waku",
                                                                                                                     params: nil), responder: PairingType.Participant(publicKey: "be9225978b6287a02d259ee0d9d1bcb683082d8386b7fb14b58ac95b93b2ef43"),
                                                                                         expiry: 1632742217,
                                                                                         state: PairingType.State(metadata: AppMetadata(name: "iOS",
                                                                                                                                   description: "",
                                                                                                                                   url: "",
                                                                                                                                   icons: [])))))
    
    static let unencryptedPairingApproveSubscription = try! JSONRPCRequest(
        method: RelayJSONRPC.Method.subscription.rawValue,
        params: RelayJSONRPC.SubscriptionParams(
            id: "", data: RelayJSONRPC.SubscriptionData(
                topic: "", message: pairingApproveJSONRPCRequest.json().toHexEncodedString(uppercase: false)
            )
        )
    ).json()
    
    static let pairingApproveJSON = """
    {
    "id":1630150217000,
    "jsonrpc":"2.0",
    "method":"wc_pairingApprove",
    "params":{
        "responder":{
            "publicKey":"be9225978b6287a02d259ee0d9d1bcb683082d8386b7fb14b58ac95b93b2ef43"
        },
        "state":{
            "metadata":{
                "name":"iOS",
                "description":"",
                "url":"",
                "icons":[]
            }
        },
        "topic":"fefc3dc39cacbc562ed58f92b296e2d65a6b07ef08992b93db5b3cb86280635a",
        "relay":{
            "protocol":"waku"
        },
        "expiry":1632742217
    }
    }
    """
}

