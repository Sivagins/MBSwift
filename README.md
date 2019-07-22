# MBSwift
MBicycle development company swift library

## Using of AlertBuilder
```
let alertController = AlertBuilder(style: .alert)
                      .addAction("OK", completion: nil)
                      .build()
```

## Using of Observable

```
var value = Observable(value: "John")
value.observe(queue: .main) { oldValue, newValue in
  guard let newName = newValue else {
    return
  }
  print(String(format: "%@ change name to %@.", oldValue, newName))
}
```
