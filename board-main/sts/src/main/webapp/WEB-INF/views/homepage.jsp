<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
  <link rel="stylesheet" href="${path}/resources/css/mainStyle.css">
  <link rel="stylesheet" href="${path}/resources/css/banner.css">
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/6779d7995e.js" crossorigin="anonymous"></script>
  <title>아트소다 :: Artsoda [미술 정보사이트] </title>
  
<!-- 캘린더 -->
      <script>
        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화

        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            // let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            // let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
        }
        
        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar();    // 달력 다시 생성
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function leftPad(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }

    </script>
    <!-- -----------------< 메인배너 >----------------- -->
   <div>
    <div class="main-slider-container">
      <div class="main-slider">
        <div class="main-slide"><img src="${path}/resources/img/dartist_kimyoungjin.jpg"></div>
        <div class="main-slide"><img src="${path}/resources/img/noPaint.jpg"></div>
        <div class="main-slide"><img src="${path}/resources/img/leegunhee.jpg"></div>
        <div class="main-slide"><img src="${path}/resources/img/romanceFlowers.jpg"></div>
        <!-- 추가적인 이미지를 필요한 만큼 추가하세요 -->
       </div>
       <div class="main-slider-controls">
        <button class="main-prev-button">⟵</button> 
        <a class="main-slide-counter"></a>
        <button class="main-play-pause-button">⏯
        </button>
        <button class="main-next-button">⟶</button>
        </div>
    </div>

    <!-- -----------------< 캘린더 >----------------- -->
    <div class="calender-navi">
   <table class="Calendar">
    <thead>
        <tr>
            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
            <td colspan="5">
                <span id="calYear"></span>년
                <span id="calMonth"></span>월
            </td>
            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
        </tr>
    </thead>
    </table>
    </div>

     <!-- -----------------< 3버튼 >----------------- -->
		<!--   죄송합니다!대구리 박아야되는 부분 -->
     <div class="wrap">
    <ul class="tab-style tab-block">
      <li class="box">
        <input type="radio" id="tab1" name="tab" checked>
        <label for="tab1" onclick="showTabContent('.tab_cont', 0)">개인전</label>
      </li>
      <li  class="box">
        <input type="radio" id="tab2" name="tab">
        <label for="tab2" onclick="showTabContent('.tab_cont', 1)">단체전</label>
      </li>
      <li class="box">
        <input type="radio" id="tab3" name="tab">
        <label for="tab3" onclick="showTabContent('.tab_cont', 2)">공모 소식</label>
      </li>
    </ul>
    
      <!-- 슬라이드 -->
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <div class="inner">
            <div class="con">
              <img src="${path}/resources/img/poster1.jpg">
              <h4>당신은 누구십니까?</h4>
              <p>2023.07.03 ~ 2023.09.07 </p>
              <p>여성역사공유공간 서울여담채</p>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="inner">
            <div class="con">
              <img src="${path}/resources/img/poster2.jpg">
              <h4>펼침의 기호들 </h4>
              <p>2023.08.10 ~ 2023. 08.21</p>
              <p>아트 포 랩 Art For Lab </p>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="inner">
            <div class="con">
              <img src="${path}/resources/img/poster3.jpg">
              <h4>나의 평안한 밤이 당신에게도</h4>
              <p>2023.08.18 ~ 2023.08.30</p>
              <p>갤러리 목</p>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="inner">
            <div class="con">
              <img src="${path}/resources/img/poster4.jpg">
              <h4>Green Motion</h4>
              <p>2023.08.22 ~ 2023.09.03</p>
              <p>청주미술창작스튜디오</p>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="inner">
            <div class="con">
              <img src="${path}/resources/img/poster5.jpg">
              <h4>사과 씨앗 같은것</h4>
              <p>2023.04.27 ~ 2024.02.12</p>
              <p>백남준 아트센터</p>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="inner">
            <div class="con">
              <img src="${path}/resources/img/poster6.jpg">
              <h4>Drunkard's Move</h4>
              <p>2023.08.23 ~ 2023.09.06</p>
              <p>대전테마예술창작센터</p>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="inner">
            <div class="con">
              <img src="${path}/resources/img/poster7.jpg">
              <h4>이상한 꿈 / 미제사건</h4>
              <p>2023.08.24 ~ 2023.08.30</p>
              <p>더 레퍼런스</p>
            </div>
          </div>
        </div>
      </div>
  
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>

  </div>
</div>
  <script>
    const swiper = new Swiper(".wrap", { // 프레임 요소명

      navigation: {
        nextEl: ".swiper-button-next", //다음 버튼 요소명
        prevEl: ".swiper-button-prev", //이전 버튼 요소명 
      }, 
      direction: "horizontal", // 스와이프방향
      spaceBetween: 0, 
      loop:true,
      centeredSlides:true, // 슬라이더 패널을 항상 가운데로 정렬
      speed: 1000, // 슬라이더 이동 속도 지정
      grabCursor: true, // 스와이프 시 마우스 포인터 모양 변경 
      slidesPerView:"auto", //css에 지정한 슬라이더의 크기를 반영
      effect:"coverflow", //이펙트 효과 지정
      slidesPerView: 3.5, // 한 번에 보여줄 슬라이드 개수

     coverflowEffect: {
      rotate: 30, //회전 각도 지정
      stretch: 70, //슬라이드 간의 당김 정도 지정
      depth: 400, //원근감 지정
      modifier: 1, // 중첩정도의 정도
      slideShadows: false, // 슬라이드의 그림자 생성 
     } 
 
    });

            /*-------------------<메인배너>--------------------*/
        
            const slider = document.querySelector(".main-slider");
const slides = document.querySelectorAll(".main-slide");
/*버튼 값주기*/ 
const prevButton = document.querySelector(".main-prev-button");
const nextButton = document.querySelector(".main-next-button");
const playPauseButton = document.querySelector(".main-play-pause-button");
/*슬라이더 버튼*/
const slideCounter = document.querySelector(".main-slide-counter");

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
	slider.style.transform = 'translateX('+offset+'%)';
}

function updateSlideCounter() {
	const currentNumber = currentIndex + 1;
	slideCounter.textContent = currentNumber+'/'+slides.length;
}

function togglePlayPause() {
  isPlaying = !isPlaying;
  if (isPlaying) {
    playPauseButton.textContent = "⏹";
    intervalId = setInterval(nextSlide, 3000);
  } else {
    playPauseButton.textContent = "▶️";
    clearInterval(intervalId);
  }
}

prevButton.addEventListener("click", prevSlide);
nextButton.addEventListener("click", nextSlide);
playPauseButton.addEventListener("click", togglePlayPause);

intervalId = setInterval(nextSlide, 4000); // 4초마다 슬라이드 변경

updateSliderPosition();
updateSlideCounter();

  </script>