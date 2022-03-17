// TODO

// core version + navigation, pagination modules:
import Swiper, { Navigation, Pagination } from "swiper"
import "swiper/swiper-bundle.css"

// configure Swiper to use modules
Swiper.use([Navigation, Pagination]);

const loadSwiperCarousel = () => {
  new Swiper(".mySwiper", {
    slidesPerGroup: 1,
    loop: false,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    }
  });
}

export { loadSwiperCarousel };
