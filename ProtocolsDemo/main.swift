// Protocols can be adopted by either classes or structures
// 1 strucutre / class can adopt more than 1 protocols too
protocol CanFly {
    // the following method does not and need not have any implementation inside the protocol
    func fly()
}

// extension example on protocols
extension CanFly {
    func fly() {
        print("Default implementation")
    }
}


class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell")
        }
    }
    
//    func fly() {
//        print("The bird flaps its wings and lifts off into the sky")
//    }
}

// the following is a subclass of Bird class
class Eagle: Bird , CanFly{
    func fly() {
        print("The eagle flaps its wings and lifts off into the sky")
    }
    
    
    func soar() {
        print("The eagle glides in the air using air curents")
    }
    
    
}

class Penguin: Bird {
    
    func swim() {
        print("The penguin swims")
    }
}

struct FlyingMuseum {
    
    // protocol is passed into the params of function
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane : CanFly {
    // The following function need not be overloaded even though the Airplane class extends the protocol CanFly, this is because there already exists an extension of CanFly which is doing the below thing for us already
//    func fly() {
//        print("airplane uses its engine to lift off")
//    }
    
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()
myEagle.soar()

let myPenguin  = Penguin()
myPenguin.layEgg()
myPenguin.swim()
//myPenguin.fly()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
// the following statement wont work as penguin class does not adopt the CanFly protocol
//museum.flyingDemo(flyingObject: myPenguin)

let myAirplane = Airplane()
museum.flyingDemo(flyingObject: myAirplane)
