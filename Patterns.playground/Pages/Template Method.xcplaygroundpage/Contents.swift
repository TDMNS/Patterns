import Cocoa

/// Существует салон по покупке автомбилей с маркой Toyota.
/// В России сборка машин отличается тем что там руль с левой стороны, а в Японии с правой.
/// Клиенты не могут выбирать расположение руля, вместо этого выбором расположения занимается страна в которой производится автомобиль.

enum TypeDriveSystem {
    case FF, FR, RR, FOURWD, MID, AT
}

enum SteeringWheelPosition {
    case left, right, center
}

protocol Toyota {
    
    var color: CGColor { get }
    var amountDoors: Int { get }
    var numberIncludedWheels: Int { get }
    var typeDriveSystem: TypeDriveSystem { get }
    var steeringWheelPosition: SteeringWheelPosition? { get set }
    
//    func buildCar()
//    func chooseColor()
//    func chooseAmountDoors()
//    func chooseNumberIncludedWheels()
//    func chooseTypeDriveSystem()
    mutating func choosenSteeringWheelPosition()
    
//    init(
//        color: CGColor,
//        amountDoors: Int,
//        numberIncludedWheels: Int,
//        typeDriveSystem: TypeDriveSystem
//    )
    
}

extension Toyota {
    
    mutating func buildCar() {
        chooseColor()
        chooseAmountDoors()
        chooseNumberIncludedWheels()
        chooseTypeDriveSystem()
        choosenSteeringWheelPosition()
    }
    private func chooseColor() {
        print("Choose color = \(self.color)")
    }
    private func chooseAmountDoors() {
        print("Choose amount doors = \(self.amountDoors)")
    }
    private func chooseNumberIncludedWheels() {
        print("Choose number included wheels = \(self.numberIncludedWheels)")
    }
    private func chooseTypeDriveSystem() {
        print("Choose type drive system = \(self.typeDriveSystem)")
    }
    
}

struct ToyotaChina: Toyota {
    
    var color: CGColor
    
    var amountDoors: Int
    
    var numberIncludedWheels: Int
    
    var typeDriveSystem: TypeDriveSystem
    
    var steeringWheelPosition: SteeringWheelPosition?
    
    mutating func choosenSteeringWheelPosition() {
        self.steeringWheelPosition = .right
        guard let steeringWheelPosition = self.steeringWheelPosition else {
            return
        }
        print("Choose steering wheel position = \(steeringWheelPosition)")
    }
    
}

final class ToyotaRU: Toyota {
    
    var color: CGColor
    var amountDoors: Int
    var numberIncludedWheels: Int
    var typeDriveSystem: TypeDriveSystem
    var steeringWheelPosition: SteeringWheelPosition?
    
    init(color: CGColor, amountDoors: Int, numberIncludedWheels: Int, typeDriveSystem: TypeDriveSystem) {
        self.color = color
        self.amountDoors = amountDoors
        self.numberIncludedWheels = numberIncludedWheels
        self.typeDriveSystem = typeDriveSystem
    }
    
    func choosenSteeringWheelPosition() {
        self.steeringWheelPosition = .left
        guard let steeringWheelPosition = self.steeringWheelPosition else {
            return
        }
        print("Choose steering wheel position = \(steeringWheelPosition)")
    }
    
}

final class ToyotaJP: Toyota {

    var color: CGColor
    var amountDoors: Int
    var numberIncludedWheels: Int
    var typeDriveSystem: TypeDriveSystem
    var steeringWheelPosition: SteeringWheelPosition?
    
    init(color: CGColor, amountDoors: Int, numberIncludedWheels: Int, typeDriveSystem: TypeDriveSystem) {
        self.color = color
        self.amountDoors = amountDoors
        self.numberIncludedWheels = numberIncludedWheels
        self.typeDriveSystem = typeDriveSystem
    }
    
    func choosenSteeringWheelPosition() {
        self.steeringWheelPosition = .right
        guard let steeringWheelPosition = self.steeringWheelPosition else {
            return
        }
        print("Choose steering wheel position = \(steeringWheelPosition)")
    }

}

final class ToyotaBY: Toyota {

    var color: CGColor
    var amountDoors: Int
    var numberIncludedWheels: Int
    var typeDriveSystem: TypeDriveSystem
    var steeringWheelPosition: SteeringWheelPosition?
    
    init(color: CGColor, amountDoors: Int, numberIncludedWheels: Int, typeDriveSystem: TypeDriveSystem) {
        self.color = color
        self.amountDoors = amountDoors
        self.numberIncludedWheels = numberIncludedWheels
        self.typeDriveSystem = typeDriveSystem
    }
    
    func choosenSteeringWheelPosition() {
        self.steeringWheelPosition = .center
        guard let steeringWheelPosition = self.steeringWheelPosition else {
            return
        }
        print("Choose steering wheel position = \(steeringWheelPosition)")
    }

}

print("====================================")
print("Toyota in China")
var toyotaChina = ToyotaChina(
    color: .white,
    amountDoors: 100,
    numberIncludedWheels: 400,
    typeDriveSystem: .AT)
toyotaChina.buildCar()
print("====================================")
//print("Toyota in Russia")
//let toyotaRU = ToyotaRU(
//    color: .black,
//    amountDoors: 4,
//    numberIncludedWheels: 4,
//    typeDriveSystem: .FOURWD)
//toyotaRU.buildCar()
//print("====================================")
//print("Toyota in Japan")
//let toyotaJP = ToyotaJP(
//    color: .white,
//    amountDoors: 4,
//    numberIncludedWheels: 4,
//    typeDriveSystem: .FF)
//toyotaJP.buildCar()
//print("====================================")
//print("Toyota in Belarus")
//let toyotaBY = ToyotaBY(
//    color: .white,
//    amountDoors: 12,
//    numberIncludedWheels: 18,
//    typeDriveSystem: .AT
//)
//toyotaBY.buildCar()
//print("====================================")
