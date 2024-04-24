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

## Pet List:

- Implemented a list view displaying pet data, including the first small photo, name, gender, and type.
- Handled cases where name, gender, or city have empty values, displaying "NA" accordingly.
- Implemented a placeholder for cases where no photo is received.
- Implemented pet type filtering based on available filters (All, Cat, Horse, Bird, Rabbit).
- Ensured that the "All" tab is selected by default upon app launch.
- Implemented horizontal scrolling for the filter tabs, ensuring visibility of all options.
- Implemented pagination to load the next page when scrolling to the bottom of the list.
# :iphone: Screens
![photo_2024-02-15_18-19-24](https://github.com/karar0120/pets_finder/assets/92108624/ed75b88b-26e1-4d56-a682-88e969086733)
![photo_2024-02-15_18-20-39](https://github.com/karar0120/pets_finder/assets/92108624/08032491-c781-4d4a-8635-ad675f9a19ff)
![photo_2024-02-15_18-20-26](https://github.com/karar0120/pets_finder/assets/92108624/1e9c7d6c-6445-4fdb-a465-c952ee3872a3)
![photo_2024-02-15_18-20-44](https://github.com/karar0120/pets_finder/assets/92108624/741b1449-38e8-47ff-8a2c-098eef6d58d5)
![photo_2024-02-15_18-20-31](https://github.com/karar0120/pets_finder/assets/92108624/7d52b8b3-717e-4a76-9747-c198da673c2b)
![photo_2024-02-15_18-20-42](https://github.com/karar0120/pets_finder/assets/92108624/a004c829-79b5-4f1a-85f5-3bb38806fadb)
![photo_2024-02-15_18-19-21](https://github.com/karar0120/pets_finder/assets/92108624/8a903232-33c5-40b1-845b-577cff3ae0a7)


## Pet Details:

- Implemented the display of pet details upon selection, including the first medium photo, name, size, primary color, and address.
- Handled cases where name, size, primary color, or address have empty values, displaying "NA" accordingly.
- Implemented a placeholder for cases where no photo is received.
- Implemented functionality to open the publisher's website when the button is clicked.
- Implemented navigation back to the main screen from the pet details screen.

# :iphone: Screens
![photo_2024-02-15_18-19-56](https://github.com/karar0120/pets_finder/assets/92108624/6b778b5c-8ad2-4c0a-8d4b-9c5c4667a71d)
![photo_2024-02-15_18-19-51](https://github.com/karar0120/pets_finder/assets/92108624/c15a166f-e55c-47b9-a083-e3acaac1621e)
![photo_2024-02-15_18-20-24](https://github.com/karar0120/pets_finder/assets/92108624/1bbefcdb-0735-4db6-9551-3e1831ac3431)

