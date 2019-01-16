# GYG - Code Challenge (CC)

The app is implemented with the `MVVM` architecture .

Xcode 10.1
Swift 4.2
iOS: 12.1

✔       Separate Network, Model, ViewModel and Controller layers to make project more scaleable
✔       Generic and project level usage code is seperated into extensionns
✔       Physical groups are grouped to depict shape of real  project
✔       Test Cases still needs to be worked on. 
✔       Solution can server as pilot to a scalebale application.


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
The project is using a two dependencies:  `Moya` for networking and  `Cosmos`  for Stars in UI.


## TODOz

✔ As the idea of CC is not a full fledge application so that's why there are some `TODOs` in the code and some of them are not  mentioned. e.g `UITests` and more `Uni Tests` currently just the one `ViewModel` is tested just to show the way I write tests.
✔  Filter on top right of ViewController was planned but wasn't executed