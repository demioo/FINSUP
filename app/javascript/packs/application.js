import "bootstrap";
import 'slick-carousel/slick/slick.js';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

const rightArrow = document.querySelector('.single-item').dataset.imgRight;
const leftArrow = document.querySelector('.single-item').dataset.imgLeft;

$('.single-item').slick({
  prevArrow:`<img class='a-left control-c prev slick-prev' src='${leftArrow}'>`,
  nextArrow:`<img class='a-right control-c next slick-next' src='${rightArrow}'>`
});
