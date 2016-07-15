# Hair Salon Webpage

#### Ruby Week 3 Independent Project for Epicodus, 07/15/2016

#### By Brett New

## Description

This program will allow the salon owner to read, add, delete, and update both stylists and clients, as well as adding clients to stylists.

## Setup/Installation Requirements

* Clone this repository
* Run ruby app.rb in the terminal
* Type localhost:4567 in browser.
* In a terminal window, run postgres, and leave it running.
* In another terminal window, type following instructions into PSQL:
- CREATE DATABASE hair_salon;
- CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
- CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int, phone varchar, email varchar);
- CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

## Known Bugs

No known bugs.

## Support and Contact Details

Contact Brett New at brett.new91@gmail.com

## Technologies Used

* HTML
* CSS
* Bootstrap
* Ruby
* Sinatra
* PSQL

## Links

Git Hub Repository: https://github.com/brettnew/ruby-week-3

### License

*This software is licensed under the GPL license.*

Copyright (c) 2016 Brett New
