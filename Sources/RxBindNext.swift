// The MIT License (MIT)
//
// Copyright (c) 2017 taewan kim
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

//http://blog.xebia.com/function-references-in-swift-and-retain-cycles/
//https://medium.com/@gnod94/improvements-of-flatmap-function-in-rxswift-5d70add0fc88#.mjmtg1sp3


import Foundation
import RxSwift
import RxCocoa

public extension ObservableType {
    
    public func bindNext<A: AnyObject>(weak obj: A,
                         _ onNext: @escaping (A) -> ((Self.E) -> Swift.Void)) -> Disposable {
        
        return self.bind(onNext: { [weak obj] (value: Self.E) in
            guard let `self` = obj else { return }
            onNext(self)(value)
        })
    }
}



extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    public func drive<A: AnyObject>(weak obj: A,
                      _ onNext: @escaping (A) -> ((Self.E) -> Swift.Void),
                      onCompleted: (() -> Void)? = nil,
                      onDisposed: (() -> Void)? = nil) -> Disposable {
        
        return self.drive(
            onNext: { [weak obj] (value: Self.E) in
                guard let `self` = obj else { return }
                onNext(self)(value)
            },
            onCompleted: onCompleted,
            onDisposed: onDisposed)
    }
}


