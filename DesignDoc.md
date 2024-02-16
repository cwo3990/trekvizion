
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

This section describes the features of the application.

### Definition of MVP
The MVP aims to provide a safe and reliable hiking experience by offering essential functionalities for trip planning, real-time tracking, and post-hike analysis.

### MVP Features
The minimal viable product (MVP) for this hiking application would include the following features:
* Image Registration: Users can upload an image and perform registration.
* Perceived Accuracy Display: Users are shown the perceived accuracy of the map before starting the hike.
* Real-Time Tracking: Utilizing the registered image, users can start and track the hike in real time.
* Trip Conclusion: Users can end the trip and view conclusive hike metrics, such as total distance traveled.


## Architecture and Design

### Software Architecture
![MVVM Architecture](/TrekVizion%20Architecture%20MVVM.png)

Trekvizion uses an MVVM architectural model because 95% of the time this application will be updating the user's location, the time spent on a hike, and the distance traveled in real time. MVVM allows for real-time updates as the view changes to reflect the state of the view model. Trekvizion also doesn't rely on many external services, so these updates can be done quickly and efficiently while offline.


## Use Cases
![Use Case Diagram](/TrekVizion%20Use%20Case%20Diagram.png)


---
### View Past Trips

__Summary__: Hiker should be able to see the history of their past trips. 

__Preconditions__: N/A

__Main Success Scenario__: 

1. Hiker proceeds to Past Trips section in System
2. System displays list of Hiker past trips with brief info for each trip

__Alternative flows__:

Past trips do not exist

2. System informs Hiker that Past Trips do not exist

__Exception Flows__: N/A

___

### Search Through Past Trips

__Summary__: Hiker should be able to search through the list of their past trips

__Preconditions__: Hiker is presented with Past Trips page

__Main Success Scenario__:

1. Hiker specifies the search criteria for their psst trips and proceeds to search
2. System displays list of Hiker past trips according to the search criteria

__Alternative flows__:

Past trips do not exist

2. System does not allow to enter search criteria

No trips satisfy for the search criteria

2. System informs Hiker that the search result is empty

__Exception Flows__: N/A

___

### Change Metric Systems

__Summary__: Hiker should be able change metric system in System settings.

__Preconditions__: N/A

__Main Success Scenario__:

1. Hiker proceeds to Settings section in System
2. System displays Settings page with the information on current metric system and ability to change it
3. Hiker proceeds to change metric system and selects a new metric system
4. Go to step 2

__Alternative flows__: N/A

__Exception Flows__: N/A

___

### Class Diagram
> _Place a class diagram here._
> _Describe your class diagram._
