//
//  Observable.swift
//  MBSwift
//
//  Created by Siarhei on 7/20/19.
//  Copyright © 2019 MBicycle. All rights reserved.
//

import Foundation

typealias OnValueChanged<T> = ((_ newValue: T, _ oldValue: T?) -> Void)

public class ImmutableObservable<T> {
    
    private var observers = [String: Observer<T>]()
    
    fileprivate var _value: T {
        didSet {
            let newValue = _value
            invokeObservers(newValue: newValue, oldValue: oldValue)
        }
    }
    
    var value: T {
        return _value
    }
    
    init(value: T) {
        _value = value
    }
    
    private func invokeObservers(newValue: T, oldValue: T?) {
        observers.values.forEach { observer in
            observer.queue.async {
                observer.handler?(newValue, oldValue)
            }
        }
    }
    
    func observe(onChanged: @escaping OnValueChanged<T>) -> Disposable {
        return observe(queue: .main, onChanged: onChanged)
    }
    
    func observe(queue: DispatchQueue, onChanged: @escaping OnValueChanged<T>) -> Disposable {
        let observer = Observer(handler: onChanged, queue: queue)
        let observerID = UUID().uuidString
        observers[observerID] = observer
        let disposeBag = Disposable { [weak self] in
            self?.observers[observerID] = nil
        }
        return disposeBag
    }
    
    func removeAll() {
        observers.removeAll()
    }
}

public class Observable<T>: ImmutableObservable<T> {
    
    override var value: T {
        get {
            return _value
        }
        set {
            _value = newValue
        }
    }
}
