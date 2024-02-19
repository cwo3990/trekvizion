
# PROJECT Design Documentation

<!-- > _The following template provides the headings for your Design
> Documentation.  As you edit each section make sure you remove these
> commentary 'blockquotes'; the lines that start with a > character
> and appear in the generated PDF in italics._ -->

## Team Information
* Team name: TrekVizion
* Team members
  * Amia Diakite
  * Connor O'Neill
  * Amir Hassanzadeh
  * William Dabney
  * Dmitrii Korobeinikov

## Executive Summary

TrekVizion is an innovated hiking application that employs image registration to refine the precision of mapped trails. This transformative technique entails superimposing trail map images onto satellite maps, resulting in heightened image accuracy. By seamlessly integrating these visual layers, TrekVizion not only enhances location tracking but also ensures the safety of its users on their wilderness journeys.

## Requirements

### Definition of MVP
The MVP aims to provide a safe and reliable hiking experience by offering essential functionalities for trip planning, real-time tracking, and post-hike analysis.

### MVP Features
The minimal viable product (MVP) for this hiking application would include the following features:
* Image Registration: Users can upload an image and perform registration.
* Perceived Accuracy Display: Users are shown the perceived accuracy of the map before starting the hike.
* Real-Time Tracking: Utilizing the registered image, users can start and track the hike in real time.
* Trip Conclusion: Users can end the trip and view conclusive hike metrics, such as total distance traveled.

#### Full Features List Intergration
* Add Hike Record: Users can record their hike experience, including ratings, difficulty levels, and attached pictures. The recorded data, along with the path taken during the hike and associated metrics, will be saved.
* Areas of Interest: During the hike, users can add areas of interest to the map and attach notes and pictures to these coordinated points.
* Emergency Contact Plan: Users are prompted to fill out an emergency contact plan before starting the hike, which will be sent to the specified individual upon hike completion.
* Time Tracking: Users can track the duration of the hike, with the ability to pause and resume the timer as needed.
* Location and Path Display: During the hike, users can view their current location on the registerd image, along with the distance traveled.
* Weather Forecast: Before starting the hike, users can view the weather forecast for a pre-specified time frame.
* Time to Sundown: During the hike, users can see the time to sundown to estimate if they can finish the hike before dark.
* Unit System Switch: In the application settings, users can switch between imperial and metric systems for convenient distance measurement during the hike.
* History Entries: Users can access the history entries of previous hikes and search through them based on specific criteria.


## Architecture and Design

### Software Architecture
![MVVM Architecture](/TrekVizion%20Architecture%20MVVM.png)

Trekvizion uses an MVVM architectural model because 95% of the time this application will be updating the user's location, the time spent on a hike, and the distance traveled in real time. MVVM allows for real-time updates as the view changes to reflect the state of the view model. Trekvizion also doesn't rely on many external services, so these updates can be done quickly and efficiently while offline.


## Use Cases
![Use Case Diagram](/TrekVizion%20Use%20Case%20Diagram.png)

### Class Diagram
![Class Diagram](/Trekvizion%20Class%20Diagram.png)

Trekvizion will consist of several screens: StartHikeView, ActiveHikeView, HistoryView, POIView, and SettingsView. Each of these views will have a corresponding ViewModel that will handle the logic and updating of the data for the corresponding views. The model of our architecutre currently consists of a Hike class which represents a hike in the system, a WeatherService, a CoregistrationService, a flutter package called GeolocationTracker for getting a user's GPS location, a flutter package called GetStorage for storing user settings, and a DBAdapter which will be an interface for a class that will access our database. Currently, the fields and methods for most of our classes are TBD. This diagram is a work in progress and will be updated as we learn more about Dart and the system we are building.
