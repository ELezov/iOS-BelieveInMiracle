import Foundation

struct Listener<T> {
    typealias Value = (new: T, old: T)
    typealias Action = (Value) -> Void
    
    let action: Action
    var skip: Int
    
    init(action: @escaping Action, skip: Int = 0) {
        self.action = action
        self.skip = skip
    }
}


private func pointer(_ objRef: AnyObject) -> String {
    let ptr: OpaquePointer = OpaquePointer(Unmanaged<AnyObject>.passUnretained(objRef).toOpaque())
    return String(describing: ptr)
}



/**
 Класс обёртка для биндинга на изменение свойств, например, ViewModel
 */
class Dynamic<T> {
    
    typealias Value = (new: T, old: T)
    typealias ListenerAction = (Value) -> Void
    
    // MARK: - Свойства
    
    private var observers: [String] = []
    private var listeners: [Listener<T>] = []
    
    var value: T {
        didSet {
            for var listener in listeners {
                if listener.skip == 0 {
                    listener.action((new: value, old: oldValue))
                } else {
                    listener.skip -= 1
                }
            }
        }
    }
    
    var listenersCount: Int {
        return listeners.count
    }
    
    
    
    // MARK: - Инициализаторы
    
    init(_ value: T) {
        self.value = value
    }
    
    
    
    // MARK: - Публичные функции
    
    /// Подписатья на изменение value. Skip позволяет пропустить вызовы.
    func bind(_ observer: AnyObject, skip: Int = 0, action: @escaping ListenerAction) {
        let listener = Listener(action: action, skip: skip)
        observers.append(pointer(observer))
        listeners.append(listener)
    }
    
    /// Подписатья на изменение value и сразу вызвать action. Skip позволяет пропустить вызовы.
    func bindAndFire(_ observer: AnyObject, skip: Int = 0, action: @escaping ListenerAction) {
        bind(observer, skip: skip, action: action)
        action((new: value, old: value))
    }
    
    /// Отписаться от изменений value
    func unbind(_ observer: AnyObject) {
        let index = observers.index(of: pointer(observer))
        
        if let index = index {
            listeners.remove(at: index)
            observers.remove(at: index)
        }
    }
    
}
