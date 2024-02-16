
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


### Use Cases
![Use Case Diagram](/TrekVizion%20Use%20Case%20Diagram.png)
> _Describe your use case diagram._


### Class Diagram
![Class Diagram](/Trekvizion%20Class%20Diagram.png)
> _Describe your class diagram._
