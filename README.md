# Space In Your Face

## About
Is a group project that took place during Mod 3 at Turing School of Software & Design. This team included [Jeremy Bennett](https://github.com/JaxJafinPapau), [Deonte Cooper](https://github.com/djc00p), [Matt Levy](https://github.com/milevy1), [Corey Sheesley](https://github.com/CSheesley?tab=repositories), and [Matt Weiss](https://github.com/Matt-Weiss).

Users of our applicaiton are able to select a range of celestial bodies that they would like to observe, and input a location based on a range of geographinc options. Once submitted, the user then receives key information for when and where to look for the objects that they selected: 

#### Example:
```
INSERT SCREEN SHOT INSTEAD
  Name: "Mercury"
  Time: "2019-05-27 15:52:18"
    decimal_attributes: {
    ra: "4.778648664415373",
    dec: "23.67915462647844",
    az: "208.18889336319882",
    el: "70.52100842964909"
```
Additionally, users who have a telescope and the necessary hardware can connect to our app, click a `search with telescope` button, and their telescpoe will locate that object in the sky. This telescope can then automatically track the object through the night sky using motor mounts. 

## Future Iterations


## Skyfield JSON
What do you do when the API that you planned your entire project around is no longer in service? You build your own open source Microservice to provide the API endpoints that you need. Using an impressive dataset provided by **Jet Propulsion Laboratory**, combined with a **Skyfield - Python** package that performs complex calculations - we were able to build out a stand alone Python application which delivers the information that we consume by our **Space In Your Face** Rails application.

#### How To Use:

Endpoint for Celestial Bodies:
`https://skyfield-json.herokuapp.com/ephemerides?`

Params:
*at this time no key is needed for this request*
`longitude` - string with underscore and direction - Ex: `41_W`
`latitude` - string with underscore and direction - Ex: `41_N`
`bodies` - comma seperated string of celestial bodies - Ex: `mercury,venus,mars,jupiter`

A successful request will have a URL which looks like this: 
`https://skyfield-json.herokuapp.com/ephemerides?longitude=41_W&latitude=41_N&bodies=mercury,venus,mars,jupiter`

#### Example JSON Output:
```
data: {
latitude: "41.345 N",
longitude: "41.112 W",
time: "2019-05-27 15:52:18",
celestial_bodies: [
{
name: "mercury",
decimal_attributes: {
ra: "4.778648664415373",
dec: "23.67915462647844",
az: "208.18889336319882",
el: "70.52100842964909"
},
strf_attributes: {
ra: "04h 46m 43.14s",
dec: "+23deg 40' 45.0"",
az: "208deg 11' 20.0"",
el: "70deg 31' 15.6""
}
},
{
name: "venus",
decimal_attributes: {
ra: "2.8393006859993086",
dec: "14.896838769797116",
az: "243.60921355444862",
el: "47.23444778722323"
},
strf_attributes: {
ra: "02h 50m 21.48s",
dec: "+14deg 53' 48.6"",
az: "243deg 36' 33.2"",
el: "47deg 14' 04.0""
}
}
```




## Getting Set up
```
$ git clone git@github.com:Matt-Weiss/spaceinyourface.git
$ bundle update
$ bundle install
$ rake db:{create,migrate,seed}
$ rails s
```


## Key Learnings
- API Creation & Consumption
- Hardware Implementation
- Microservices
- Continuous Integration
- Caching
- OAuth

## Tech Stack Used
- Ruby 2.4.1
- Rails ~> 5.2.3
- Python
- Flask
