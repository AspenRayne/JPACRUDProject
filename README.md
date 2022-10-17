# JPACRUDProject - Foodies Destinations


## Description


A Full Stack Application that allows you to track restaurants you've been to
or want to visit. Using the Google Places API, you can search for restaurants by
name and the full address will be returned. You can customize your rating, notes,
and visited status for any restaurant.


## Lessons Learned


I learned how to implement a 3rd Party API using HTTP requests to retrieve data.
To simplify this process in Java, I implemented a library using Gradle to install
dependencies from google-maps-services which greatly simplified the process of
unpacking web requests to the google api.

One interesting problem I ran into was the class declaration for the Places API
did not include Getters/Setters. This prevented the use of object fields in the
JSP expression language. To solve this I overrode the base class and used this local
extension to only use the fields relevant to my project and add the Getters/Setters.
This improved my code readability and also simplified the functionality of data access
within the JSP.

Additionally, I gained a stronger grasp on the Spring Boot MVC workflow.
Between navigating through the website, managing object access on the HTML, and
modifying a database, I feel very confident in my ability to follow full stack applications
from design to implementation.


## Technologies Used

  - Spring Boot MVC
  - Java 8
  - Google Maps API
  - MySQL
  - Sprint Tool Suite 4
  - Git
  - Gradle
  - HTML / CSS
  - JPA
  - JSP
