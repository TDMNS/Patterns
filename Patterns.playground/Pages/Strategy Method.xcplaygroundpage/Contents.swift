import Cocoa

struct UserData {
    
    let firstName: String = "Oleg"
    let lastName: String = "Kolbasa"
    let patronymic: String = "Anatolevich"
    
}

final class RequestStrategy {}
extension RequestStrategy {
    
    static func requestData(typeServerResponse: String) {
        let userData = UserData()
        switch typeServerResponse {
        case "str":
            StrStrategy.strResponse(userData: userData)
        case "csv":
            CsvStrategy.csvResponse(userData: userData)
        case "multi":
            MultiStrategy.multiResponse(userData: userData)
        default: break
        }
    }
    
}

private final class StrStrategy {
    
    static func strResponse(userData: UserData) {
        print("\(userData.firstName) \(userData.lastName)  \(userData.patronymic)")
    }
    
}

private final class CsvStrategy {
    
    static func csvResponse(userData: UserData) {
        print("\(userData.firstName);\(userData.lastName); \(userData.patronymic)")
    }
    
}

private final class MultiStrategy {
    
    static func multiResponse(userData: UserData) {
        print("\(userData.firstName)\n\(userData.lastName)\n\(userData.patronymic)")
    }
    
}

RequestStrategy.requestData(typeServerResponse: "str")
RequestStrategy.requestData(typeServerResponse: "csv")
RequestStrategy.requestData(typeServerResponse: "multi")
