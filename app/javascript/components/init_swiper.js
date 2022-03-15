// TODO

// core version + navigation, pagination modules:
import Swiper, { Navigation, Pagination } from "swiper";

// configure Swiper to use modules
Swiper.use([Navigation, Pagination]);

const loadSwiperCarousel = () => {
  new Swiper(".mySwiper", {
    slidesPerGroup: 1,
    loop: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    breakpoints: {
      // when window width is >= 320px
      320: {
        slidesPerView: 2,
        spaceBetween: 20
      },
      // when window width is >= 480px
      480: {
        slidesPerView: 3,
        spaceBetween: 30
      },
      // when window width is >= 640px
      640: {
        slidesPerView: 6,
        spaceBetween: 20,
      },
      // when window width is >= 800px
      800: {
        slidesPerView: 9,
        spaceBetween: 10,
      }
    }
  });
}

export { loadSwiperCarousel };
