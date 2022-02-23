//: [Previous](@previous)

import Cocoa

protocol CatInformation {
    func request(id: Int)
}

class Server: CatInformation {
    let cat: [Int:String] = [
        0: "Vasya",
        1: "Kesha",
        2: "Vitek"
    ]
    
    func request(id: Int) {
        print("Processing request")
    }
}

class ProxyCat: CatInformation {

    let server: Server
    
    init(server: Server) {
        self.server = server
    }
    
    func request(id: Int) {
        print("Send request")
    }
    
}

final class CashCat: ProxyCat {
    override func request(id: Int) {
        for (catId, name) in server.cat {
            if id == catId {
                print(name)
            }
        }
    }
}

class Client {
    static func clientCode(server: CatInformation) {
        server.request(id: 0)
    }
}

let server = Server()
let proxy = ProxyCat(server: server)
let cash = CashCat(server: server)

Client.clientCode(server: server)
Client.clientCode(server: proxy)
Client.clientCode(server: cash)
