# spring-boot-actuator

https://spring.io/guides/gs/actuator-service/

Building a RESTful Web Service with Spring Boot Actuator

Spring Boot Actuator is a sub-project of Spring Boot. It adds several production grade services to your application with little effort on your part. In this guide, you’ll build an application and then see how to add these services.
What you’ll build

This guide will take you through creating a "hello world" RESTful web service with Spring Boot Actuator. You’ll build a service that accepts an HTTP GET request:

$ curl http://localhost:9000/hello-world

It responds with the following JSON:

{"id":1,"content":"Hello, World!"}

There are also has many features added to your application out-of-the-box for managing the service in a production (or other) environment. The business functionality of the service you build is the same as in Building a RESTful Web Service. You don’t need to use that guide to take advantage of this one, although it might be interesting to compare the results.

