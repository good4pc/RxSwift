//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by Suresh on 05/04/18.
//  Copyright © 2018 FIngent. All rights reserved.
//

import UIKit
import RxSwift
/**
 # RX Swift study material
 
 Rx swift references from [this link](https://medium.com/ios-os-x-development/learn-and-master-%EF%B8%8F-the-basics-of-rxswift-in-10-minutes-818ea6e0a05b)
 
 webserive tutorial  here ->[click](https://medium.com/@gonzalezreal/consuming-web-services-with-swift-and-rx-71b87b0f9a4e)
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        basicObserver()
        exampleForCreatingObservableAndSubscription()
        implementingMapping()
        
    }
    /**
     # Basic observer creation and printing
     */
    func basicObserver(){
        print("-----------------------------------------------------")
        let hellowSequence = Observable.of("This is my first observable","second","third","fourth")
        hellowSequence.subscribe { (event) in
            print(event)
            }.dispose()
    }
    /**
     # Example for Observing and Subscribing
     This below method cretes an observable and subscribes the data inside the obeservable.
     There are three methods in a subscribing
     - next
     - error
     - completed
     */
    func exampleForCreatingObservableAndSubscription(){
        print("-----------------------------------------------------")
        let observable2 = Observable.from(["H","E","L","L","O"])
        observable2.subscribe { (event) in
            switch event{
            case .next(let valueIs):
                print(valueIs)
            case .error(let error) :
                print(error.localizedDescription)
            case .completed :
                print("completed by pc")
            }
            
            }.dispose()
    }
    /**
     # Mapping
     */
    func implementingMapping() {
        print("-----------------------------------------------------")
        let observable = Observable.from([1,20,43,34,2,6,7,8,0,3,6,4])
        observable.map { (value) -> Int in
            return value * 10
            }.subscribe { (event) in
                print(event)
        }.dispose()
    }
    

}

