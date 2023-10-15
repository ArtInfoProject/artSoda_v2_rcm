const slider = document.querySelector(".slider");
const slides = document.querySelectorAll(".slide");
/*버튼 값주기*/ 
const prevButton = document.querySelector(".prev-button");
const nextButton = document.querySelector(".next-button");
const playPauseButton = document.querySelector(".play-pause-button");
/*슬라이더 버튼*/
const slideCounter = document.querySelector(".slide-counter");

let currentIndex = 0;
/*버튼 재생정지*/ 
let isPlaying = true;
let intervalId;

function nextSlide() {
  currentIndex = (currentIndex + 1) % slides.length;
  updateSliderPosition();
  updateSlideCounter();
}

function prevSlide() {
  currentIndex = (currentIndex - 1 + slides.length) % slides.length;
  updateSliderPosition();
  updateSlideCounter();
}

function updateSliderPosition() {
  const offset = -currentIndex * 100;
  slider.style.transform = `translateX(${offset}%)`;
}

function updateSlideCounter() {
  const currentNumber = currentIndex + 1;
  slideCounter.textContent = `${currentNumber}/${slides.length}`;
}

function togglePlayPause() {
  isPlaying = !isPlaying;
  if (isPlaying) {
    playPauseButton.textContent = "정지";
    intervalId = setInterval(nextSlide, 3000);
  } else {
    playPauseButton.textContent = "재생";
    clearInterval(intervalId);
  }
}

prevButton.addEventListener("click", prevSlide);
nextButton.addEventListener("click", nextSlide);
playPauseButton.addEventListener("click", togglePlayPause);

intervalId = setInterval(nextSlide, 3000); // 3초마다 슬라이드 변경

updateSliderPosition();
updateSlideCounter();
