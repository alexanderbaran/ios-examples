//
//  ViewController.swift
//  retain-cycle
//
//  Created by Alexander Baran on 26/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

class Person {
    let name: String
    // When we introduce this variable and let Bob hold a reference to apartment, that is when we get a retain cycle.
    var apartment: Apartment?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let number: Int
    // The weak variable breaks the retain cycle. Whenever we introcude this weak reference, it means that we are not increasing the reference count on the particular property. This is kind of the fix that Swift and the documentation sort of recommends in this particular scenario.
    weak var tenant: Person?
    init(number: Int) {
        self.number = number
    }
    deinit {
        print("Apartment \(number) is being deinitialized")
    }
}

// In order for this example to work these variables need to be referenceable from here so that they won't get destroyed after viewDidLoad has finished running.
var bob: Person?
var apartment: Apartment?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bob = Person(name: "Bob")
        
        apartment = Apartment(number: 123)
        // Apartment is holding on to a strong reference to bob, this is why bob is not being deinitialized. But this is not a retain cycle. Becuse when apartment is set to nil then both deinitializers will be run. Apartments first, then Bob's. The moment the apartment loses the strong reference ot tenant Bob, bob is able to deinitialize itself correctly.
        apartment?.tenant = bob
        // When we introduce this then both are being kept in memory and none of the deinitializers are being called.
        bob?.apartment = apartment
        
        bob = nil
        apartment = nil
        

    }

}

