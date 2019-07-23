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

## Using of Animation Group

```
let errorAnimationTask = AnimationGroupTask(duration: 0.25, delay: 0, options: .curveLinear) {
  // ...
}
let separatorMovingAnimationTask = AnimationGroupTask(duration: 0.7) {
  // ...
}
UIView.animate(onCompleted: {
  print("Animations ended!")
}, tasks: errorAnimationTask, separatorMovingAnimationTask)
```
