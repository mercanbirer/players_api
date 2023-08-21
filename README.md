# Flutter

//bloc
 
 pubspec.yaml: 
 
 dependencies:
  flutter_bloc: ^8.0.0

//get_it

dependencies:

  get_it: ^7.2.0
  
//image

 Image:
 pubspec.yaml: 
 
 assets:
  - assets/images/img.jpg

//json

 JsonSerializable: 
 command : flutter pub add json_annotation dev:build_runner dev:json_serializable

//RegisterSingleton:
  We use this method to register a singleton instance get<T>())

//RegisterLazySingleton:
  get<T>() is called the first time

//RegisterFactory:
  We use this method to return a new instance of type T every time we call get<T>()


 
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
