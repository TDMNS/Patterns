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
    
    func buildCar()
    func chooseColor()
    func chooseAmountDoors()
    func chooseNumberIncludedWheels()
    func chooseTypeDriveSystem()
    func choosenSteeringWheelPosition()
    
    init(
        color: CGColor,
        amountDoors: Int,
        numberIncludedWheels: Int,
        typeDriveSystem: TypeDriveSystem
    )
    
}

extension Toyota {
    
    func buildCar() {
        chooseColor()
        chooseAmountDoors()
        chooseNumberIncludedWheels()
        chooseTypeDriveSystem()
        choosenSteeringWheelPosition()
    }
    func chooseColor() {
        print("Choose color = \(self.color)")
    }
    func chooseAmountDoors() {
        print("Choose amount doors = \(self.amountDoors)")
    }
    func chooseNumberIncludedWheels() {
        print("Choose number included wheels = \(self.numberIncludedWheels)")
    }
    func chooseTypeDriveSystem() {
        print("Choose type drive system = \(self.typeDriveSystem)")
    }
    
}

private final class ToyotaRU: Toyota {
    
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

private final class ToyotaJP: Toyota {

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

private final class ToyotaBY: Toyota {

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

func chooseCarCountry(country: String) {
    switch country {
    case "Russia":
        print("Toyota in Russia")
        let toyotaRU = ToyotaRU(
            color: .black,
            amountDoors: 4,
            numberIncludedWheels: 4,
            typeDriveSystem: .FOURWD)
        toyotaRU.buildCar()
    case "Japan":
        print("Toyota in Japan")
        let toyotaJP = ToyotaJP(
            color: .white,
            amountDoors: 4,
            numberIncludedWheels: 4,
            typeDriveSystem: .FF)
        toyotaJP.buildCar()
    case "Belarus":
        print("Toyota in Belarus")
        let toyotaBY = ToyotaBY(
            color: .white,
            amountDoors: 12,
            numberIncludedWheels: 18,
            typeDriveSystem: .AT
        )
        toyotaBY.buildCar()
    default: break
    }
}

chooseCarCountry(country: "Russia")
chooseCarCountry(country: "Japan")
chooseCarCountry(country: "Belarus")
