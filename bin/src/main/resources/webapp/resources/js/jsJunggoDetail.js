var swiper = new Swiper(".mySwiper", {
  cssMode: true,
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  pagination: {
    el: ".swiper-pagination",
  },
  mousewheel: true,
  keyboard: true,
});

//heartBtn
const iconHeart = document.querySelectorAll('.heartBtn');
iconHeart.forEach(heart => {
  heart.addEventListener('click', () => {
    heart.classList.toggle('active');
    
    if(heart.classList.contains('active')){
      heart.innerHTML = '<i class=" xi-heart xi-4x" style="color:red;"></i>';
    }else{
      heart.innerHTML = ' <i class="xi-heart-o xi-4x"></i>';
    }
  })
});


const DEFAULT_HEIGHT = 0; // textarea 기본 height

const $textarea = document.querySelector('.commentsWrite-textarea');

$textarea.oninput = (event) => {
  const $target = event.target;

  $target.style.height = 0;
  $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
};

// const fristBtn = document.querySelector('.fristCommentsBtn');
// fristBtn.addEventListener('click',function(){
//   fristBtn.classList.toggle('clicked');
// });

// const lastBtn = document.querySelector('.lastCommentsBtn');
// lastBtn.addEventListener('click',function(){
//  lastBtn.classList.toggle('clicked');
// });





// function clickHeart(){
//   const clickHeartBtn = document.querySelector(".heartBtn");

//   if(clickHeartBtn.innerHTML = '<i class=" xi-heart-o xi-3x"></i>'){
//     clickHeartBtn.innerHTML = '<i class=" xi-heart xi-3x"></i>';
//     clickHeartBtn.style.color='red';
//   }
// }