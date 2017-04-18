RxBindNext
====

![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/Then.svg?branch=master)](https://travis-ci.org/devxoul/Then)
[![CocoaPods](http://img.shields.io/cocoapods/v/Then.svg)](https://cocoapods.org/pods/Then)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)



Use weak references to pass to bindNext.



At a Glance
-----------
There are two ways to use **RxBindNext**.

```swift
final class RxBindNextExample {
    let disposeBag = DisposeBag()
    
    init() {
        //First style
         Observable.just("taewan")
            .bindNext(weak: self, type(of: self).greetAgain)
            .disposed(by: disposeBag)
            
        //Second style
        Observable.just("taewan")
            .bindNext(weak: self, RxBindNextExample.greetAgain)
            .disposed(by: disposeBag)
    }
    
    func greetAgain(person: String) {
        print("Hello again, " + person + "!")
    }
}
```


And drive is also supported.

```swift
Observable.just("taewan")
  .asDriver(onErrorJustReturn: "-")
  .drive(weak: self, type(of: self).greetAgain)
  .disposed(by: disposeBag)
```

Installation
------------

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'RxBindNext', '~> 0.0.2'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "taewan0530/RxBindNext" ~> 0.0.2
    ```


Reference
-------
http://blog.xebia.com/function-references-in-swift-and-retain-cycles/
https://medium.com/@gnod94/improvements-of-flatmap-function-in-rxswift-5d70add0fc88#.mjmtg1sp3

License
-------

**RxBindNext** is under MIT license. See the [LICENSE](LICENSE) file for more info.