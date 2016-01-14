$(document).ready(function () {
  $(".nav-tabs > li:nth-child(1)").on("click", function() {
    $("div > #logout").hide()
    $("div > #profile").hide()
    $("div > #home").show()
  });

  $(".tabs > li:nth-child(2)").on("click", function() {
    $("div > #integrity").hide()
    $("div > #whole_self").hide()
    $("div > #kindness").show()
  });

  $(".tabs > li:nth-child(3)").on("click", function() {
    $("div > #kindness").hide()
    $("div > #integrity").hide()
    $("div > #whole_self").show()
  });
});
