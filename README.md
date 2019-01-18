# GYG - Code Challenge (CC)

## Architecture

The app is implemented with the `MVVM` architecture .

## SDK & Tools

Xcode 10.1<br />
Swift 4.2<br />
iOS: 12.1<br />

## Considerations

✔       Separate Network, Model, ViewModel and Controller layers to make project more scaleable<br /> 
✔       Generic and project level usage code is seperated into extensions<br />
✔       Physical groups are created to depict shape of real  project<br />
✔       Test Cases still needs to be worked on<br />
✔       Solution can serve as pilot to a scalebale application<br />


## Installation

The project is using `Cocoa-pods` as a package manager so please run the following in terminal in the project folder.

```bash
pod install
```

Make sure you have the the `pod` repo updated if not please run the following.

```bash
pod repo update && pod install
```


## Dependencies
The project is using two dependencies:<br />
`Moya` for networking and  `Cosmos`  for Stars in UI.


## TODOz

✔ As the idea of CC is not a full fledge application so that's why there are some `TODOs` in the code e.g `UITests` and more `UI Tests` are needed. Currently just one `ViewModel` class is being tested  to show the way I write tests.<br />
✔  Filter on top right of ViewController was planned but wasn't executed. 
