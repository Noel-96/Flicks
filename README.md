# Flicks
<img src="https://img.shields.io/badge/status-Active-green" height="20"> <img src="https://img.shields.io/github/issues/adumrewal/tmdb-ios-app" height="20"> <img src="https://img.shields.io/github/stars/adumrewal/tmdb-ios-app" height="20"> <img src="https://img.shields.io/github/license/adumrewal/tmdb-ios-app" height="20"> <img src="https://img.shields.io/badge/architecture-MVVM-yellow" height="20"> <img src="https://img.shields.io/badge/language-Swift-yellow" height="20"> 

The app is built using the MVVM + Combine architecture with offline support via coredata persistant storage. The app fetches movies and movie details from the TMDB database. As of now only part of the app has been build, the following features and pages will be added later on.

The Movie Database (TMDb) iOS App in Swift - https://developers.themoviedb.org/3/getting-started/introduction


## Technical specs
- Language: Swift
- Networking: URLSession
- DB Store: CoreData
- Architecture: MVVM
- Pagination
- ViewModelsfor storing UI state
- Protocols for Movie list views
- Custom Built Image Loader for image fetching and caching
- Swift standard coding/decoding for custom objects

## Features
- Now Playing tab
- Popular tab
- Top Rated tab
- Upcoming tab
- Movie Detail view
- App works offline and saves previous responses in DB (using Core Data)
- Pagination - fixes required
- Search Tab - not implemented
- Fav Tab - not implemented

## TODO:

- [ ] Pull to refresh in LazyVStack.
- [x] Movie Details page.
- [x] Rewrite network manager and store classes to utilize combine.
- [x] Monitoring network connection and refreshing UI.
- [ ] Implement pagination fixes 
- [ ] Add a favourite tab 
- [ ] Unit testing of view models.
- [ ] Unit testing of service class.

## Installation
The app relies on no external libraries,
- Clone repo (pod files are included)
- Open `Flicks.xcodeproj` in XCode
  - Choose simulator/device of choice
  - Clean Build Folder  
- Click on Run

Funtionality
## MoviesList
The page by default loads the popular movies from the TMDB database and caches it to coredata for offline usage, when the app is offline an bar is show to indicate that the current movie data is cached data. Using network monitoring if there is nodata the app reload the movies list.

## MovieDetails 
The page loads the cached movie details when the live data api call fails for any reason, an offline bar is shown when the displyed data is cached data. The page auto reloads the movie details when the device is back online by monitoring the network status.
