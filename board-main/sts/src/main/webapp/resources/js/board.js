
    const subCateLinks = document.querySelectorAll('#sub-cate');
    subCateLinks.forEach(link => {
        link.addEventListener('mouseenter', () => {
            if (!link.classList.contains('selected')) {
                document.querySelector('.selected').style.backgroundColor = '#e5e5e5';
                document.querySelector('.selected').style.color = '#777777';
            }
        });

        link.addEventListener('mouseleave', () => {
            if (!link.classList.contains('selected')) {
                document.querySelector('.selected').style.backgroundColor = '#00d3ff';
                document.querySelector('.selected').style.color = '#fff';
            }
        });
    });
 
    document.addEventListener("DOMContentLoaded", function() {
        var tdElement = document.querySelector(".lol");

        if (tdElement) {
            var communityCategory = tdElement.textContent.trim();

            if (communityCategory.includes("구인구직")) {
                tdElement.style.color = "blue";
            } else if (communityCategory.includes("광고홍보")) {
                tdElement.style.color = "purple";
            } else if (communityCategory.includes("중고장터")) {
                tdElement.style.color = "red";
            }
        }
    });


	document.addEventListener("DOMContentLoaded", function () {
	        var hiringCells = document.querySelectorAll(".lol");
	
	        hiringCells.forEach(function (cell) {
	            var cellText = cell.textContent.trim(); 
	
	            if (cellText === '구인구직') {
	                cell.style.color = "#0057ff";
	            } else if (cellText === '광고홍보') {
	                cell.style.color = "#9e4bcf";
	            } else {
	                cell.style.color = "#715746";
	            }
	   		 });
	    });  
	    
    document.addEventListener("DOMContentLoaded", function () {
        var pageLinks = document.querySelectorAll(".pagination a:not(:first-child):not(:last-child)");

        pageLinks.forEach(function (link) {
            link.addEventListener("click", function (event) {
                pageLinks.forEach(function (link) {
                    link.classList.remove("active");
                });

                link.classList.add("active");

                event.preventDefault(); // Prevent the default link behavior
            });
        });
    });
 
	document.addEventListener('DOMContentLoaded', function() {

		document.getElementById("searchBtn").onclick = function() {

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;
			let category = '${param.category}';

			location.href = "/community/communityList?listPageNum=1"
					+ "&searchType=" + searchType + "&keyword=" + keyword
					+ "&category=" + category;

		};

	});