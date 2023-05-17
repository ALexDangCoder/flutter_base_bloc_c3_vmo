
# Project architecture (Clean Architecture Approach)

### 1. Why:
    * We want to separate what type of database that we use for storage (might want to change it
      later on)
    * To adhere SOLID principles since we are using OOP for this project.
    * Ensuring UI layers don't know what is going on at data layer at all.
    * Might want to separate each layers into different packages.
### 2. Presentation - Domain - Data.
### 3. Presentation layer consist of
    * Widgets
    * BLoC
        * Bloc only manages UI state based on business logic
### 4. Domain layer (Business logic layer)
    * Repositories (interfaces aka idea how the logic would behave)
    * Entities (or models which what UI needs)
    * Usecases (user stories)
        * Typically one function, but can be more if they are functionality related.
        * Remember, one class for one responsibility.
### 5. Data layer
    * Data Sources
        * remotes (API)
        * locals (Database)
    * Models
        * request
        * response
    * Repositories (Implementation from Domain layer)
### 6. More insight of layers
   ![image](https://miro.medium.com/max/772/0*sfCDEb571WD-7EfP.jpg)
### 7. The inner layer should **NOT** know what the outer layer has / do.
### 8. Reference:
    1. https://github.com/ResoCoder/flutter-tdd-clean-architecture-course
    2. https://github.com/ShadyBoukhary/flutter_clean_architecture (We don't use this plugin)
    3. https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html

# Project Structure

```
project
|--.fvm                                              # fvm config using for project
|   |--fvm_config.json                               # config file
|--android                                           # android project dir
|--assets                                            # application all assets
|   |--images                                        # application image assets
|   |--fonts                                         # application font assets
|--fastlane                                          # config ci/cd using fastlane
|--ios                                               # ios dir
|--lib                                               # main project dart lib entry point
|   |--app                                           # application layer for clean architecture 
|   |   |--core                                      # core folder include string extension,...
|   |   |--di                                        # dependencies injection registration for project
|   |   |--manager                                   # manager folder include style manager, other resource manager
|   |   |--multi-languages                           # localization for project, using easy_localization and google sheet generator csv
|   |   |--route                                     # route config for project, include generateRoute and route define all screen of project
|   |   |--utils                                     # utils for application layer
|   |   |--app.dart                                  # library app_layer using for import and combine most of application layer files
|   |--data                                          # data layer for clean architecture 
|   |   |--login                                     # login feature folder
|   |   |   |--api                                   # api folder
|   |   |   |   |--login_api.dart                    # login abstract class for retrofit
|   |   |   |   |--login_api.g.dart                  # login generator class for retrofit
|   |   |   |--models                                # models folder for data layer
|   |   |   |   |--request                           # request model folder
|   |   |   |   |--response                          # response model folder
|   |   |   |--repositories                          # repositories folder for data layer
|   |   |   |   |--login_repository_impl             # repository impl will extend from login_repository abstract class
|   |   |--utils                                     # utils for data layer
|   |   |   |--exceptions                            # custom exception for data layer
|   |   |   |--interceptors                          # custom interceptors for data layer
|   |--domain                                        # domain layer for clean architecture 
|   |   |--login                                     # login domain feature folder
|   |   |   |--entities                              # entities folder
|   |   |   |   |--user_entity.dart                  # user entity will extends from login_response.dart
|   |   |   |--repositories                          # abstract class for login feature
|   |   |   |--usecases                              # usecases for login feature
|   |--firebase                                      # firebase config for app that generated by Firebase CLI 
|   |--presentation                                  # presentation layer for clean architecture 
|   |   |--common                                    # common widget or common screen
|   |   |--login                                     # login presentation layer
|   |   |   |--bloc                                  # login bloc for whole login screen
|   |   |   |--ui                                    # ui folder for login feature
|   |   |   |   |--login_screen.dart                 # login ui frame
|   |   |   |   |--widgets                           # widgets folder for nested widget in login feature
|   |   |   |--login_route.dart                      # login route class define BlocProvider for Bloc class of login feature
|   |--main.dart                                     # main config Material App and runApp
|--scripts                                           # folder contain scripts file make easier to combine command 
|--test                                              # unit test
|--web
|--.gitignore                                        # ignore file of git
|--README.md                                         # ReadMe for this project
|--analysis_options.yaml                             # lint rule configuration, config rule here
|--.gitlab-ci.yml                                    # config ci/cd for gitlab
|--pubspec.yaml                                      # dart package management file, add new dependencies here
|--setup_app.sh                                      # Script set up app before run app

```



# Clean Architect feature template

```
|   |--data                                          # data layer for clean architecture 
|   |   |--generate_feature                          # generate_feature folder
|   |   |   |--api                                   # api folder
|   |   |   |   |--generate_feature_api.dart         # generate_feature abstract class for retrofit
|   |   |   |--models                                # models folder for data layer
|   |   |   |   |--request                           # request model folder
|   |   |   |   |--response                          # response model folder
|   |   |   |--repositories                          # repositories folder for data layer
|   |   |   |   |--generate_feature_repository_impl  # generate_feature repository impl file
|   |--domain                                        # domain layer for clean architecture 
|   |   |--generate_feature                          # generate_feature domain folder
|   |   |   |--entities                              # entities folder
|   |   |   |--repositories                          # generate_feature domain repositories folder
|   |   |   |   |--generate_feature_repository.dart  # generate_feature repository abstract file
|   |   |   |--usecases                              # generate_feature usecases folder
|   |   |   |   |--generate_feature_usecase.dart     # generate_feature usecase file

```