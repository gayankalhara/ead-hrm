# EAD HRM

A simple Human Resource Management Application using Hibernate Framework for Enterprise Application Development Assignment

## Functional Requirements
  - R1: The application shall allow the user to add and edit a Role
  - R2: The application shall allow the user to add and edit a Task
  - R3: The application shall not allow the user to delete any Roles or Tasks
  - R4: The application shall allow the user to add and edit an Employee
  - R5: The application shall allow the user to assign a valid Role to an Employee when the employee is created
  - R6: The application shall allow the user to re-assign a valid Role to an Employee 
  - R7: The application shall allow the user to assign one or many valid Tasks to an Employee

## Non-Functional Requirements
  - NF1: Data should be persistent and should be saved in a Relational Database.
  - NF2: The Hibernate should be used as an Object Relational Mapping framework to persist the web application’s data.
  - NF3: The User Interfaces of the Web Application can be implemented with JSP or Servlets

## Tech

This application uses following frameworks.

* [Hibernate ORM](http://hibernate.org/orm/) - Object/Relational Mapping Framework
* [Bootstrap](http://getbootstrap.com/) - Bootstrap CSS Framework

## Installation

### Pre-requisites 
  - This application require JDK and GlassFish Server to run
  - MySQL Server should be up and running on port 3306 (For different port please configure it on ./src/java/hibernate.cfg.xml)
  - A database should be created on MySQL Servers as 'hrm'

First of all clone the repository

```sh
$ git clone https://github.com/gayankalhara/ead-hrm.git
```

Open the project in NetBeans and run it.

License
----

Apache License 2.0