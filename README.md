# currency_converter

![Coverage](./coverage_badge.svg)

#### A cross platform app using the flutter framework that utilizes the freeecurrencyapi to display available currencies, convert between them, and display last 7 days historical data.

## How to build & Run
    - You need to obtain your api key from [freecurrencyapi](https://app.freecurrencyapi.com/)
    - Clone the github repository
    - Run `flutter run --dart-define API_KEY=<your obtain api key>` and choose the target device.

## App architecture

    - Adapts clean architecture for its structure.
    - Uses the Repository pattern as a coordinator between the various data sources
    - Features are broken down into `currencies` and `settings` with the typical clean architecture layering
    - flutter_bloc is used for managing the app state.
    - SettingCubit and LocalCubit are the only global managers exposed across the widget tree because of functionalities provided by them.
    - get_it is used as the Dependency Injection library. It creates and manages all dependencies across all layers.
    - BlocProviders are used to provide widget tree scoped cubits and make use of their mechanism of closing the cubits. 

## Local Storage

    - Platform specific data stores are used (keystore and keychain) to store simple user data securly (like settings and preferences).
    - Realm is used as the querable database to store currencies and their rates.
    - The main requirements of the local storage was it being querable and supporting encryption I initially wanted to use drift 
    but it doesn't support encryption just yet (April 2023). I thought I should revert to Hive since it supports encryption but it isn't querable.
    - I used realm becuase it the next best database from speed and efficiency points of view.
    - I didn't use SQL databases because non-sql alternatives are faster in the context of flutter.

## Images 

    - I delibrately used svg images for efficiency (flags are downloaded from flagcdn).
    - I initially used `flutter_svg` but it is not the best for svgs sourced from urls (since those can have style tags and tags that aren't supported).
    - I then converted to using `jovial_svg` which is way better in rendering svgs from urls since it supports the style tags. (It is a little slow though but I thought that having correct flags is much more important in this case).

## Unit Testing

    - You need to run `flutter pub run realm install` before running the tests.
    - All the UI Managers (Cubits) are 100% unit tested
    - I avoided testing classes and functions that just forward calls to their dependencies
    - All Repositories are tested with mocked dependencies.
    - The Storage service that is based on realm is also tested.

## Screens
<img src="https://user-images.githubusercontent.com/36048466/233849925-1c1bab24-b44c-4e76-aef3-7a2d460513c7.png" height=25% width=25%> <img src="https://user-images.githubusercontent.com/36048466/233849922-3b95f559-7d61-4ba0-9089-27fe5b615ca4.png" height=25% width=25%>
<br>
<img src="https://user-images.githubusercontent.com/36048466/233849917-c30b241c-de8f-429b-b3b4-e3a95b4496a4.png" height=25% width=25%> <img src="https://user-images.githubusercontent.com/36048466/233849915-28f33512-635b-4bc6-a312-2d028ed1667e.png" height=25% width=25%>
<br>
<img src="https://user-images.githubusercontent.com/36048466/233849911-def35bee-d2e4-4799-8353-7126914f4d84.png" height=25% width=25%> <img src="https://user-images.githubusercontent.com/36048466/233849910-10db4606-dcf0-413c-ac3d-2d986d24513f.png" height=25% width=25%>
<br>
<img src="https://user-images.githubusercontent.com/36048466/233849907-41a5050c-e452-4f69-81af-d1e96a7cf9ff.png" height=25% width=25%> <img src="https://user-images.githubusercontent.com/36048466/233849904-b44325be-1658-49d6-9c81-63011fc4429c.png" height=25% width=25%>

## Getting Started with Flutter

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
