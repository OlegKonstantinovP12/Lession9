//
//  main.swift
//  Lession9
//
//  Created by Oleg Konstantinov on 30.09.2025.
//

import Foundation

/*
 1 - Простой класс "Человек"
 Создай класс Person с полями name (String) и age (Int).
 Добавь метод sayHello(), который печатает "Привет, меня зовут \(name)".
 Создай несколько экземпляров и вызови метод.
 */
class Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("Привет, меня зовут \(name)")
    }
}
let jack = Person(name: "Jack", age: 18)
let john = Person(name: "John", age: 30)
jack.sayHello()
john.sayHello()

/*
 2 - Класс "Машина" и водитель
 Создай класс Car с полями model и owner: Person?.
 Добавь метод assignOwner(_:), который "сажает" человека в машину.
 Создай пару машин и людей, назначь владельцев.
 */

class Car {
    private let model: String
    private var owner: Person?
    
    init(model: String) {
        self.model = model
    }
    
    func assignOwner(person: Person) {
        self.owner = person
        if let owner {
            print("Владелец автомобиля \(model) теперь \(owner.name)")
        }
    }
}

let mazda = Car(model: "Mazda")
let ford = Car(model: "Ford")

mazda.assignOwner(person: jack)
ford.assignOwner(person: john)


/*
 3 - Метод, изменяющий состояние
 Добавь метод celebrateBirthday(), который увеличивает возраст на 1.
 Проверь, что возраст действительно увеличивается.
 */

extension Person {
    func celebrateBirthday() {
        age += 1
    }
}
jack.celebrateBirthday()
print(jack.age)
/*
 4 - Наследование
 Создай класс Animal с полем name и методом makeSound().
 Создай классы-наследники Dog и Cat, переопредели метод makeSound(), чтобы собака лаяла, а кошка мяукала (вывести в принте).
 */
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound(){ }
}
/*
 5 - Расширенный инициализатор
 Расширенный инициализатор
 В Dog добавь новое поле breed (порода) и переопредели инициализатор, чтобы он принимал породу.
 Создай несколько собак с разными породами.
 */
class Dog: Animal {
    let breed: String
    
    init(name: String, breed: String) {
        self.breed = breed
        super.init(name: name)
    }
    
    override func makeSound() {
        print("\(name) say Woof!")
    }
}

class Cat: Animal {
    
    override func makeSound() {
        print("\(name) say Meow!")
    }
}

let cat = Cat(name: "Kitty")
let dog = Dog(name: "Buddy", breed: "Podenco Andaluz")
cat.makeSound()
dog.makeSound()


/*
 6 - Магазин и товары
 Создай класс Product с названием и ценой.
 Создай класс Store, который хранит массив товаров и метод printCatalog().
 Добавь метод sell(productName:), который удаляет товар из каталога.
 Создай магазин, добавь товары, продай один товар, снова выведи каталог.
 */

class Product {
    let name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class Store {
    
    private var catalog: [Product] = []

    func add (product: Product) {
        catalog.append(product)
    }
    
    func printCatalog(){
        print("")
        
        if catalog.isEmpty {
            print("Каталог товаров пуст")
        } else {
            print("Каталог товаров:")
            catalog.forEach{ print("\($0.name): \($0.price)₽") }
//            такой же вывод только без функции высшего порядка
//            for product in catalog {
//                print("\(product.name): \(product.price)₽")
//            }
        }
    }
    
    func sell(productName: String) {
        print("")
//        Так как метод firstIndex возвращает опционал, то можно получить индекс, и сразу извлечь опционал
        if let index = catalog.firstIndex(where: { $0.name == productName }) {
            let soldProduct = catalog.remove(at: index)
            print("Продан товар \(soldProduct.name) по цене \(soldProduct.price)₽")
        } else {
            print("Товар не найден")
        }
    }
}


let store = Store()

let water = Product(name: "Вода", price: 35)
let bread = Product(name: "Хлеб", price: 12.5)
let butter = Product(name: "Масло", price: 100)

store.add(product: water)
store.add(product: bread)
store.add(product: butter)

store.printCatalog()

store.sell(productName: "Хлеб")
store.printCatalog()
