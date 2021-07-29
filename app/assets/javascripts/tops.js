$("#AboutButton").click(function() {
  $('html,body').animate({
      scrollTop: $(".about-page").offset().top},
      'slow');
});
$("#PortfolioButton").click(function() {
  $('html,body').animate({
      scrollTop: $(".portfolio").offset().top},
      'slow');
})
