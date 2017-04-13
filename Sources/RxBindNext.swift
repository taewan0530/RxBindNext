//
//  RxBindFunc.swift
//  RxBindFunc
//
//  Created by kimtaewan on 2017. 3. 16..
//  Copyright © 2017년 taewan. All rights reserved.
//
//http://blog.xebia.com/function-references-in-swift-and-retain-cycles/
//https://medium.com/@gnod94/improvements-of-flatmap-function-in-rxswift-5d70add0fc88#.mjmtg1sp3

import Foundation
import RxSwift
import RxCocoa

public extension ObservableType {
    
    public func bindNext<A: AnyObject>(
        weak obj: A,
        _ onNext: @escaping (A) -> ((Self.E) -> Swift.Void)) -> Disposable {
        
        return self.bindNext { [weak obj] (value: Self.E) in
            guard let `self` = obj else { return }
            onNext(self)(value)
        }
    }
}

