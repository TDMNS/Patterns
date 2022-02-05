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
    
class Toyota {
    private let color: CGColor
    private let amountDoors: Int
    private let numberIncludedWheels: Int
    private let typeDriveSystem: TypeDriveSystem
    var steeringWheelPosition: SteeringWheelPosition = .center
    
    init(
        color: CGColor,
        amountDoors: Int,
        numberIncludedWheels: Int,
        typeDriveSystem: TypeDriveSystem
    ){
        self.color = color
        self.amountDoors = amountDoors
        self.numberIncludedWheels = numberIncludedWheels
        self.typeDriveSystem = typeDriveSystem
    }
    
    func buildCar() {
        print("Choose color = \(self.color)")
        print("Choose amount doors = \(self.amountDoors)")
        choosenSteeringWheelPosition()
        print("Choose number included wheels = \(self.numberIncludedWheels)")
        print("Choose type drive system = \(self.typeDriveSystem)")
    }
    
    func choosenSteeringWheelPosition() {}
}

final class ToyotaRU: Toyota {
    override func choosenSteeringWheelPosition() {
        self.steeringWheelPosition = .left
        print("Choose steering wheel position = \(self.steeringWheelPosition)")
    }
}

final class ToyotaJP: Toyota {
    override func choosenSteeringWheelPosition() {
        self.steeringWheelPosition = .right
        print("Choose steering wheel position = \(self.steeringWheelPosition)")
    }
}

final class ToyotaBY: Toyota {
    override func choosenSteeringWheelPosition() {
        self.steeringWheelPosition = .center
        print("Choose steering wheel position = \(self.steeringWheelPosition)")
        print("Additional color = red")
    }
}

print("====================================")
print("Toyota in Russia")
let toyotaRU = ToyotaRU(
    color: .black,
    amountDoors: 4,
    numberIncludedWheels: 4,
    typeDriveSystem: .FOURWD)
toyotaRU.buildCar()
print("====================================")
print("Toyota in Japan")
let toyotaJP = ToyotaJP(
    color: .white,
    amountDoors: 4,
    numberIncludedWheels: 4,
    typeDriveSystem: .FF)
toyotaJP.buildCar()
print("====================================")
print("Toyota in Belarus")
let toyotaBY = ToyotaBY(
    color: .white,
    amountDoors: 12,
    numberIncludedWheels: 18,
    typeDriveSystem: .AT
)
toyotaBY.buildCar()
print("====================================")
