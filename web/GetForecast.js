/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  function ChangeZip(){
  var zip = document.getElementById("zipCode").value;
  jQuery(document).ready(function($) {
  $.ajax({
  //url : "http://api.wunderground.com/api/f2d797797fddd20c/geolookup/conditions/q/DE/Claymont.json",
  url: "http://api.wunderground.com/api/f2d797797fddd20c/geolookup/conditions/q/" + zip + ".json",
  dataType : "jsonp",
  success : function(parsed_json) {
  var location = parsed_json['location']['city'];
  var temp_f = parsed_json['current_observation']['temp_f'];
  var weather = parsed_json['current_observation']['weather'];
  var feels = parsed_json['current_observation']['feelslike_f'];
  var wind = parsed_json['current_observation']['wind_string'];
  var percip = parsed_json['current_observation']['percip_today_in'];
  var icon = parsed_json['current_observation']['icon_url'];
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
  document.getElementById("day1").innerHTML = (date1+"<br>High: "+day1h+"<br>Low: "+day1l+"<br>Avg Wind: "+day1w+" mph<br>"+day1Con);
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
  }
  });
});
}