# BMI Tracker App

A simple Flutter application for managing BMI Tracker App with CRUD operations.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)

## Introduction

Welcome to the BMI Tracker App! This Flutter application allows users to create, read, update, and delete BMI. The focus is on providing an intuitive and visually appealing interface for managing BMI efficiently.

## Features

- Authentication: Users can sign in anonymously using Firebase Auth.
- BMI Calculation: Users can enter their weight, height, and age to calculate their BMI.
- Data Storage: BMI data along with the current time is saved in Firestore.
- BMI Status: The app displays the status related to the calculated BMI.
- View Entries: Users can view a list of all entries sorted by the most recent date, paginated with 10 entry records per page.
- Real-time Updates: The app updates in real-time when the data changes on Firestore.
- Edit and Delete Entries: Users can edit existing entries and delete entries.
- Sign-out Functionality: Users can sign out from the app.

## Getting Started

### Prerequisites

Make sure you have Flutter and Dart installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

    ```bash
    git clone [https://github.com/karar0120/bmi_tracker-flutter.git](https://github.com/karar0120/bmi_tracker.git)
    cd bmi-tracker-app-flutter
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```

## Project Structure

    .
    ├── core                       # For all common and core files.
    │   ├── error                  # contains all Exceptions and Failures classes
    │   ├── presentation           # Common presentation files
    |   │   └── blocs              # Common blocs
    |   │   └── pages              # Core pages
    |   │   └── widgets            # Common widgets
    │   └── route                  # Routes for navigation
    │   └── theme                  # Theme data
    │   └── usecases               # Common usecases
    |
    ├── data                       # Data Files of Feature 1
    │   ├── datasources            # DataSources Abstract Files and Implementations
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   ├── models                 # Models for data
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   └── repositories           # Repositories Implementation Classes
    │       └── feature            # Feature 1 (for exp : Todo Feature)
    │           └── sub-feat.      # Sub feature
    ├── domain                     # Domain
    │   ├── entities               # Entities For Feature 1
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   ├── usecases               # Usecases of Feature 1
    │   │   └── feature            # Feature 1 (for exp : Todo Feature)
    │   │       └── sub-feat.      # Sub feature
    │   └── repositories           # Repositories Abstract Classes
    │       └── feature            # Feature 1 (for exp : Todo Feature)
    │           └── sub-feat.      # Sub feature
    └── presentation               # Presentation files
        ├── blocs                  # Blocs
        │   └── feature            # Feature 1 (for exp : Todo Feature)
        │       └── sub-feat.      # Sub feature
        ├── pages                  # Pages
        │   └── feature            # Feature 1 (for exp : Todo Feature)
        │       └── sub-feat.      # Sub feature
        └── widgets                # Widgets
            └── feature            # Feature 1 (for exp : Todo Feature)
                └── sub-feat.      # Sub feature

## Architecture

This app uses [***Clean Architecture by Robert C Martin***]

<img src="https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/blob/master/architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>

Image Source : [ResoCoder](https://resocoder.com)

## Branches

    .
    ├── master                       # Contains the latest release
           ├── dev                   # Contains the latest development
                ├── feature1         # feature 1 created from dev
                ├── feature2         # feature 2 created from dev
                ├── feature3         # feature 3 created from dev
                ├── bugFix1          # bugfix 1 created from dev
                ├── bugFix2          # bugfix 1 created from dev
                ├── docChange1       # docChange 1 created from dev
                ├── docChange1       # docChange 2 created from dev


# :iphone: Screens
![Screenshot_1713933873](https://github.com/karar0120/bmi_tracker/assets/92108624/dca638c7-9073-47ff-b5d9-c6767497ed08)
![Screenshot_1713933881](https://github.com/karar0120/bmi_tracker/assets/92108624/dd830406-8f1c-4fe7-9860-9190862140d1)
![Screenshot_1713933889](https://github.com/karar0120/bmi_tracker/assets/92108624/cb8f370e-abde-4307-8088-647cc5a33750)
![Scree![Screenshot_1713933895](https://github.com/karar0120/bmi_tracker/assets/92108624/05847af5-757e-4b9b-98e4-eecabc668270)
![Screenshot_1713933907](https://github.com/karar0120/bmi_tracker/assets/92108624/13d92c7e-29a6-4704-b478-b1f0b0bea57f)
![Screenshot_1713933927](https://github.com/karar0120/bmi_tracker/assets/92108624/ecbda7cb-6c6d-476e-8406-4c0330e6ff69)


# Time Spent
Approximately 6 hours were spent on implementing the features, setting up Firebase integration, testing, and writing documentation.

# APK
Attached is the APK file for the project.

