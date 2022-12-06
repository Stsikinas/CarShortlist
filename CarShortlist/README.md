# Stavros Tsikinas (Android & iOS Developer)
Hi! The source code provided is an attempt I did to build an app based on **Egardia's Assessment**. The following *Markdown* file is meant to explain the app. 

## App UI/UX
The application is a table view with cells showing:

 - Car image (if exists)
 - Car manufacturer and model
 - Price tag
 
There are 2 screens on the app:
1. Main Table View
2. The **Detail View** presents the selected car with additional information, such as *year* and *kilometers*.
## Data
The data (cars) are retrieved from the *"cars.json"* file that was provided in the description of the assessment, via github RAW path.
## Building UI
The UI is built in a mixed way. For instance, detail view is constructed through storyboards (static view), whereas view cells and misc views are constructed programmatically.
## Architecture
- MVVM is followed, in order to ease the scalability and testability of the project. 
- Protocols and Extensions are also included in the app, to define separate workload for the corresponding classes/structs/services.
## Version Control
Trunk-based development was followed, since the project consisted of 1 developer and the app was starting up.