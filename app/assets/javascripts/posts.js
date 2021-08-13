document.addEventListener('turbolinks:load', function(){
  var mySwiper = new Swiper('.swiper-container', {
    // Optional parameters
    loop: false,

    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
      dynamicBullets: true,
		  dynamicMainBullets: 1,
    },

    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  })
});
