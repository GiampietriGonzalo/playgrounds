import UIKit

class Car {
    let brand: String
    let model: String
    var color: String
    
    init(brand: String, model: String, color: String) {
        self.brand = brand
        self.model = model
        self.color = color
    }
}

struct Things {
    let car: Car
}

let myCar = Car(brand: "Chevrolet", model: "Prisma", color: "white")
let thing1 = Things(car: myCar)
let thing2 = Things(car: thing1.car)

thing2.car.color = "green"
thing1.car.color = "blue"

print("myCar color \(myCar.color)")
print("thing1 car color \(thing1.car.color)")
print("thing2 car color \(thing2.car.color)")
