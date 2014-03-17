---
title: Excursion
description: simple example Rails app
author: sandbil
tags: ruby, ruby on rails test, testing

---
Excursion
=========
This simple example Rails app, tourist site, catalog excursions 
 
 Ruby version 2.0, Rails 4.0.3
 
## Requirements

  Install ImageMagick.
  
## Database creation
### Development
 Use rake db:migrate RAILS_ENV=development
 For load fixtures use rake db:fixtures:load 

### Production
  Use follow rake command:
     rake db:create RAILS_ENV=production
     rake db:migrate RAILS_ENV=production
  for load example fixtures
     rake db:fixtures:load RAILS_ENV=production
 
[![screenshot1](/public/screenshot_th1.png)](/public/screenshot1.png)
[![screenshot2](/public/screenshot_th2.png)](/public/screenshot2.png)

