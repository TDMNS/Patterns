import Cocoa

struct UserData {
    
    let firstName: String = "Oleg"
    let lastName: String = "Kolbasa"
    let patronymic: String = "Anatolevich"
    
}

protocol FormatStrategy {
    
    func convertData(userData: UserData) -> String

}

private class StrStrategy: FormatStrategy {
    
    func convertData(userData: UserData) -> String {
        return "\(userData.firstName) \(userData.lastName) \(userData.patronymic)"
    }
    
}

private class CsvStrategy: FormatStrategy {
    
    func convertData(userData: UserData) -> String {
        return "\(userData.firstName);\(userData.lastName);\(userData.patronymic)"
    }
    
}

private class MultiStrategy: FormatStrategy {
    
    func convertData(userData: UserData) -> String {
        return "\(userData.firstName)\n\(userData.lastName)\n\(userData.patronymic)"
    }
    
}

class Server {
    private var currentStrategy: FormatStrategy = StrStrategy()
}
extension Server {
    
    func setStrategy(strategy: String) {
        //TDMNSTODO: - перевести входящие данные в нижний регистр
        switch strategy {
        case "str":
            currentStrategy = StrStrategy()
        case "csv":
            currentStrategy = CsvStrategy()
        case "multi":
            currentStrategy = MultiStrategy()
        default:
            //TDMNSTODO: - add unknown or 404 error here
            break
        }
    }
    
    func getData() -> String {
        let userData = UserData()
        return currentStrategy.convertData(userData: userData)
    }
    
}

func output(userInput: Int) {
    print("Enter output format: ")
    print("1. str")
    print("2. csv")
    print("3. multi")
    print("Your answer: \(userInput)")
}

let server = Server()

output(userInput: 1)
server.setStrategy(strategy: "str")
print(server.getData())

output(userInput: 2)
server.setStrategy(strategy: "csv")
print(server.getData())

output(userInput: 3)
server.setStrategy(strategy: "multi")
print(server.getData())
