import "bootstrap";
import 'slick-carousel/slick/slick.js';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

let rightArrow = document.querySelector('.single-item')
let leftArrow = document.querySelector('.single-item')
if (rightArrow) {
  rightArrow = rightArrow.dataset.imgRight;
  leftArrow = leftArrow.dataset.imgLeft;


  $('.single-item').slick({
    prevArrow:`<img class='a-left control-c prev slick-prev' src='${leftArrow}'>`,
    nextArrow:`<img class='a-right control-c next slick-next' src='${rightArrow}'>`
  });
}
