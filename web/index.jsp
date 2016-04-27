<%-- 
    Document   : index
    Created on : Apr 24, 2016, 12:26:54 PM
    Author     : BPark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Weather</h1>
        Zipcode:
        <input type="text" name="zipCode" maxlength="5" minlength="5" id="zipCode" value="" />
        <input type="submit" onclick="ChangeZip();"/>
        <br>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
        <script>
    jQuery(document).ready(function($) {
  $.ajax({
  url: "https://api.forecast.io/forecast/c5612f751d08416c9984d47217f17267/39.8468,75.7116",
  dataType : "jsonp",
  success : function(parsed_json) {
      var KStemp = parsed_json['currently']['temperature'];
      document.getElementById("ShowKSTemp").innerHTML = ("The Current Temperature in Kennet Square is: " + KStemp);
      
      var KSDay1High = parsed_json['daily']['data']['1']['temperatureMax'];
      var KSDay1Low = parsed_json['daily']['data']['1']['temperatureMin'];
      var KSDay1Wind = parsed_json['daily']['data']['1']['windSpeed'];
      document.getElementById("KSDay1").innerHTML = ("High: " + KSDay1High + "<br>Low: " + KSDay1Low + 
              "<br>Wind: " + KSDay1Wind + " MPH");
      
      var KSDay2High = parsed_json['daily']['data']['2']['temperatureMax'];
      var KSDay2Low = parsed_json['daily']['data']['2']['temperatureMin'];
      var KSDay2Wind = parsed_json['daily']['data']['2']['windSpeed'];
      document.getElementById("KSDay2").innerHTML = ("High: " + KSDay2High + "<br>Low: " + KSDay2Low + 
              "<br>Wind: " + KSDay2Wind + " MPH");
      
      var KSDay3High = parsed_json['daily']['data']['3']['temperatureMax'];
      var KSDay3Low = parsed_json['daily']['data']['3']['temperatureMin'];
      var KSDay3Wind = parsed_json['daily']['data']['3']['windSpeed'];
      document.getElementById("KSDay3").innerHTML = ("High: " + KSDay3High + "<br>Low: " + KSDay3Low + 
              "<br>Wind: " + KSDay3Wind + " MPH");
      
      var KSDay4High = parsed_json['daily']['data']['4']['temperatureMax'];
      var KSDay4Low = parsed_json['daily']['data']['4']['temperatureMin'];
      var KSDay4Wind = parsed_json['daily']['data']['4']['windSpeed'];
      document.getElementById("KSDay4").innerHTML = ("High: " + KSDay4High + "<br>Low: " + KSDay4Low + 
              "<br>Wind: " + KSDay4Wind + " MPH");
      
      var KSDay5High = parsed_json['daily']['data']['5']['temperatureMax'];
      var KSDay5Low = parsed_json['daily']['data']['5']['temperatureMin'];
      var KSDay5Wind = parsed_json['daily']['data']['5']['windSpeed'];
      document.getElementById("KSDay5").innerHTML = ("High: " + KSDay5High + "<br>Low: " + KSDay5Low + 
              "<br>Wind: " + KSDay5Wind + " MPH");
  }
  });
});    
        </script>
        <script>

            function ChangeZip(){
                var zip = document.getElementById("zipCode").value;
    document.getElementById("ShowKSTemp").innerHTML = "";
    document.getElementById("KSDay1").innerHTML = "";
    document.getElementById("KSDay2").innerHTML = "";
    document.getElementById("KSDay3").innerHTML = "";
    document.getElementById("KSDay4").innerHTML = "";
    document.getElementById("KSDay5").innerHTML = "";
                jQuery(document).ready(function($) {
  $.ajax({
  //url : "http://api.wunderground.com/api/f2d797797fddd20c/geolookup/conditions/q/DE/Claymont.json",
  url: ("http://api.wunderground.com/api/f2d797797fddd20c/geolookup/conditions/q/" + zip + ".json"),
  dataType : "jsonp",
  success : function(parsed_json) {
  var location = parsed_json['location']['full'];
  var temp_f = parsed_json['current_observation']['temp_f'];
  var weather = parsed_json['current_observation']['weather'];
  var feels = parsed_json['current_observation']['feelslike_f'];
  var wind = parsed_json['current_observation']['wind_string'];
  var percip = parsed_json['current_observation']['percip_today_in'];
  var icon = parsed_json['current_observation']['icon_url'];
  //alert("Current temperature in " + location + " is: " + temp_f);
  document.getElementById("ForecastDisplay").innerHTML = ("Current temperature in " + location + " is: " 
          + temp_f + "<br><br>Feels Like: " + feels + "<br>Avg Wind: " + wind);
  document.getElementById("weatherDiscreption").innerHTML = (weather);
  document.getElementById("image").src = (icon);
  }
  });
});
jQuery(document).ready(function($) {
  $.ajax({
  url : "http://api.wunderground.com/api/f2d797797fddd20c/forecast10day/q/" + zip + ".json",
  dataType : "jsonp",
  success : function(parsed_json) {
  var curHigh = parsed_json ['forecast']['simpleforecast']['forecastday']['0']['high']['fahrenheit'];
  var curLow = parsed_json ['forecast']['simpleforecast']['forecastday']['0']['low']['fahrenheit'];
  document.getElementById("ForecastContinue").innerHTML = ("High: "+ curHigh + "<br>Low: " + curLow);
      
  var date1 = parsed_json ['forecast']['simpleforecast']['forecastday']['1']['date']['weekday'];
  var day1h = parsed_json ['forecast']['simpleforecast']['forecastday']['1']['high']['fahrenheit'];
  var day1l = parsed_json ['forecast']['simpleforecast']['forecastday']['1']['low']['fahrenheit'];
  var day1w = parsed_json ['forecast']['simpleforecast']['forecastday']['1']['avewind']['mph'];
  var day1Con = parsed_json ['forecast']['simpleforecast']['forecastday']['1']['conditions'];
  var day1icon = parsed_json ['forecast']['simpleforecast']['forecastday']['1']['icon_url'];
  document.getElementById("day1").innerHTML = (date1+"<br><br>High: "+day1h+"<br>Low: "+day1l+"<br>Avg Wind: "+day1w+" mph<br>"+day1Con);
  document.getElementById("day1image").src = (day1icon);
  
  var date2 = parsed_json ['forecast']['simpleforecast']['forecastday']['2']['date']['weekday'];
  var day2h = parsed_json ['forecast']['simpleforecast']['forecastday']['2']['high']['fahrenheit'];
  var day2l = parsed_json ['forecast']['simpleforecast']['forecastday']['2']['low']['fahrenheit'];
  var day2w = parsed_json ['forecast']['simpleforecast']['forecastday']['2']['avewind']['mph'];
  var day2Con = parsed_json ['forecast']['simpleforecast']['forecastday']['2']['conditions'];
  var day2icon = parsed_json ['forecast']['simpleforecast']['forecastday']['2']['icon_url'];
  document.getElementById("day2").innerHTML = (date2+"<br>High: "+day2h+"<br>Low: "+day2l+"<br>Avg Wind: "+day2w+" mph<br>"+day2Con);
  document.getElementById("day2image").src = (day2icon);
  
  var date3 = parsed_json ['forecast']['simpleforecast']['forecastday']['3']['date']['weekday'];
  var day3h = parsed_json ['forecast']['simpleforecast']['forecastday']['3']['high']['fahrenheit'];
  var day3l = parsed_json ['forecast']['simpleforecast']['forecastday']['3']['low']['fahrenheit'];
  var day3w = parsed_json ['forecast']['simpleforecast']['forecastday']['3']['avewind']['mph'];
  var day3Con = parsed_json ['forecast']['simpleforecast']['forecastday']['3']['conditions'];
  var day3icon = parsed_json ['forecast']['simpleforecast']['forecastday']['3']['icon_url'];
  document.getElementById("day3").innerHTML = (date3+"<br>High: "+day3h+"<br>Low: "+day3l+"<br>Avg Wind: "+day3w+" mph<br>"+day3Con);
  document.getElementById("day3image").src = (day3icon);
  
  var date4 = parsed_json ['forecast']['simpleforecast']['forecastday']['4']['date']['weekday'];
  var day4h = parsed_json ['forecast']['simpleforecast']['forecastday']['4']['high']['fahrenheit'];
  var day4l = parsed_json ['forecast']['simpleforecast']['forecastday']['4']['low']['fahrenheit'];
  var day4w = parsed_json ['forecast']['simpleforecast']['forecastday']['4']['avewind']['mph'];
  var day4Con = parsed_json ['forecast']['simpleforecast']['forecastday']['4']['conditions'];
  var day4icon = parsed_json ['forecast']['simpleforecast']['forecastday']['4']['icon_url'];
  document.getElementById("day4").innerHTML = (date4+"<br>High: "+day4h+"<br>Low: "+day4l+"<br>Avg Wind: "+day4w+" mph<br>"+day4Con);
  document.getElementById("day4image").src = (day4icon);
  
  var date5 = parsed_json ['forecast']['simpleforecast']['forecastday']['5']['date']['weekday'];
  var day5h = parsed_json ['forecast']['simpleforecast']['forecastday']['5']['high']['fahrenheit'];
  var day5l = parsed_json ['forecast']['simpleforecast']['forecastday']['5']['low']['fahrenheit'];
  var day5w = parsed_json ['forecast']['simpleforecast']['forecastday']['5']['avewind']['mph'];
  var day5Con = parsed_json ['forecast']['simpleforecast']['forecastday']['5']['conditions'];
  var day5icon = parsed_json ['forecast']['simpleforecast']['forecastday']['5']['icon_url'];
  document.getElementById("day5").innerHTML = (date5+"<br>High: "+day5h+"<br>Low: "+day5l+"<br>Avg Wind: "+day5w+" mph<br>"+day5Con);
  document.getElementById("day5image").src = (day5icon);
  
  document.getElementById("logo").style.display= "block";
  }
  });
});
            }
        </script>
<br>
<h2>Current Forecast</h2>
<div id="ShowKSTemp"></div>
<div id="ForecastDisplay"></div>
<div id="ForecastContinue"></div>
<br>
<div id="weatherDiscreption"></div>
<img src="" id="image" name="image"/>
<br>
<h2>5 Day Forecast</h2>

<ul class="KS5DayUl">
    <li class="KS5DayLi" id="KSDay1"></li>
    <li class="KS5DayLi" id="KSDay2"></li>
    <li class="KS5DayLi" id="KSDay3"></li>
    <li class="KS5DayLi" id="KSDay4"></li>
    <li class="KS5DayLi" id="KSDay5"></li>
</ul>

<ul class="parent">
<li class="child" id="day1"></li>

<li class="child" id="day2"></li>

<li class="child" id="day3"></li>

<li class="child" id="day4"></li>

<li class="child" id="day5"></li>
</ul>
<ul class="imgUL">
    <img class="imgList" src="" id="day1image"/>
    <img class="imgList" src="" id="day2image"/>
    <img class="imgList" src="" id="day3image"/>
    <img class="imgList" src="" id="day4image"/>
    <img class="imgList" src="" id="day5image"/>
</ul>

<br>
<img src="https://icons.wxug.com/logos/PNG/wundergroundLogo_4c.png" id="logo" name="logo" align="bottom" height="42" width="42" style="display:none"/>
<style>
    body {background-color: darkturquoise;}
    li {
        display: inline-block;
        margin: 10px;
    }
    img.imgList {
        display:inline-block;
        margin-right: 40px;
        margin-left: 40px;
        margin-top: 0px;
    }
</style>
    </body>
</html>
