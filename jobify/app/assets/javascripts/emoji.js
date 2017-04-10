$(document).ready(function () {
   $("#slide").on( "change input", function () {
      var value = $(this).val();
      if (value == 0) {
         $("#sliderChange").text("💀");
         document.getElementById("updatenum").value = "0";
         document.getElementById("updatenum").setAttribute("value", "0");
      }
      else if (value == 1) {
         $("#sliderChange").text("😠");
         document.getElementById("updatenum").value = "1";
         document.getElementById("updatenum").setAttribute("value", "1");
      }
      else if (value == 2) {
         $("#sliderChange").text("😦");
         document.getElementById("updatenum").value = "2";
         document.getElementById("updatenum").setAttribute("value", "2");
      }
      else if (value == 3) {
         $("#sliderChange").text("😑");
         document.getElementById("updatenum").value = "3";
         document.getElementById("updatenum").setAttribute("value", "3");
      }
      else if (value == 4) {
         $("#sliderChange").text("😀");
         document.getElementById("updatenum").value = "4";
         document.getElementById("updatenum").setAttribute("value", "4");
      }
      else {
         $("#sliderChange").text("😍");
         document.getElementById("updatenum").value = "5";
         document.getElementById("updatenum").setAttribute("value", "5");

      }
   });
});
