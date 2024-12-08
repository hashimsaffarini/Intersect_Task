<div align="center">
  <a href="#">
    <img src="https://github.com/hashimsaffarini/Intersect_Task/blob/main/assets/images/netflix.svg" alt="App Logo" width="150" height="150">
  </a>  

# 🎥 Intersect Movies App 

Dive into the world of movies with the Intersect Movies App! This app features smooth animations, efficient search functionality, and real-time updates powered by TMDB APIs, along with offline caching using SharedPreferences.

---
<div align="start">

## 🏗 System Design
    ├── lib
    │   ├── core
    │   │   ├── di
    │   │   ├── helpers
    │   │   ├── networking
    │   │   ├── routing
    │   │   ├── theming
    │   │   ├── widgets
    │   ├── features
    │   │   ├── home
    │   │   │   ├── data
    │   │   │   │   ├── apis
    │   │   │   │   ├── models
    │   │   │   │   ├── repos
    │   │   │   ├── logic
    │   │   │   │   ├── cubit
    │   │   │   ├── ui
    │   │   │   │   ├── widgets
    │   ├── main.dart
    │   ├── marvel_app.dart

## ✨ Features

Intersect Movies App offers the following features:

`Clean Architecture`: The app follows clean architecture principles to ensure a maintainable and modular codebase with clear separation of concerns.
`Bloc State Management`: Efficiently manages states using Bloc and Cubit, providing seamless UI updates in response to state changes.
`TMDB API Integration`: Retrieves comprehensive data about movies, including their titles, release dates, ratings, overviews, and more using the TMDB API.
`Local Database (SharedPreferences)`: Caches data locally with SharedPreferences to ensure offline accessibility and improved performance.
`Search Functionality`: Provides real-time movie search with filtering by title, reset options, and smooth animations.
`Engaging UI/UX`: Designed with user-friendly interfaces, gradient theming, and smooth animations for a polished user experience.
`Reusable Widgets`: Utilizes a widget-based architecture for efficient code reuse across the application.

## 🎬 App Preview

|                          Home Screen                          |                          Details Screen                          |                      Search Screen                          |
| :-----------------------------------------------------------: | :------------------------------------------------------------: | :----------------------------------------------------------: |
| <img width="330" src="https://github.com/hashimsaffarini/Intersect_Task/blob/main/assets/images/home.png"> | <img width="330" src="https://github.com/hashimsaffarini/Intersect_Task/blob/main/assets/images/details.png"> | <img width="330" src="https://github.com/hashimsaffarini/Intersect_Task/blob/main/assets/images/search.png"> |


---

