<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>WidUs - ProjectList</title>
    <meta name="description" content="" />
    <meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

    <!-- JQuery cdn -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>

    <link href="../resources/project/css/projectboard/projectboard_Header.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
    
    	.dropdown{
			display: block;
		    border-top: none;
		    box-shadow: none;
		    min-width: auto;
		    position: relative;
		    padding-bottom: 0px;
		    padding-top: 0px;
    	}
    	
    	body {
    		font-family: 'Nanum Gothic', sans-serif;
    	}
        .row {
            justify-content: center;
        }

        /* project list */
        .project-list {
            width: 100%;
            height: 100%;

        }

        .project-list-card-body {
            margin: 30px 20px 20px 20px;
        }

        .search-proejct {
            display: flex;
            justify-content: space-between;
        }

        .project-search {
            border: 1px solid lightgrey;
            border-radius: 3px;
            width: 300px;
            height: 45px;
            padding-left: 10px;
            color: #6a6192;
            font-weight: 500;
            font-size:13.5px
        }

        .project-search::placeholder {
            color: #bababa;
        }

        .search-title {
            position: relative;
            display: flex;
            justify-content: space-between;
            box-sizing: border-box;
            width: 100%;
            padding-bottom: 10px;
        }

        .search-result-title {
            font-size: 18px;
            font-weight: 700;
            margin-right: 10px
        }

        .project-filter {
            display: inline-block;
            cursor: pointer;
        }

        .project-filter>img {
            display: inline-block;
        }

        .project-filter>span {
            position: relative;
            top: 1.5px;
            font-weight: 500;
            font-size: 15px;
            color: #697B8D;
        }

        .project-filter>img+span {
            margin-left: 2px
        }

        .filter-dropdown {
            position: absolute;
            top: 100%;
            left: 75%;
            width: 300px;
            height: 130px;
            background-color: white;
            border: 1px solid lightgrey;
            border-radius: 3px;
            display: none;
            z-index: 9999;
        }

        .dropdown-items {
            list-style: none;
            padding: 0px 10px 0px 10px
        }

        .dropdown-items li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 40px;
            margin: 15px 0px 15px 0px
        }

        .dropdown-items span {
            font-size: 18px;
            font-weight: 600
        }

        .jump {
            margin-top: 20px;
            border-bottom: 1px solid #555;
        }

        /* 프로젝트 li */
        .card {
            min-height: 800px
        }

        .project-info {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            min-height: 90px
        }

        .select-color {
            display: inline-block;
            height: 45px;
            width: 45px;
            background-color: orange;
            border-radius: 5px;
            border-color: orange;
            cursor: pointer;
        }

        .project-information {
            margin-left: 15px;
        }

        .project-information {
            display: inline-block;
        }

        .favorite-project,
        .setting,
        .project-name {
            display: inline-block;
        }

        .star {
            height: 25px;
            width: 25px;
        }

        .project-name {
            position: relative;
            top: 1px;
        }

        .project-name-span {
            font-weight: bold;
            font-family: inherit;
        }

        .project-area {
            overflow: scroll;
            max-height: 377px;
            padding:0 5px 0 5px;
        }
        
        .all-project {
        	max-height: 737px;
        }

        .project-area>ul {
            list-style-type: none !important;
            padding-left: 0;
        }

        .recent-modify {
            display: flex;
            align-items: center;
        }
        
        /* tabs */
        .tabs {
        	margin-top: 40px;
        	font-weight: 600;
        	font-size: 16px;
        	margin-bottom: 45px !important;
        }
        
        .part-tabs, .all-tabs {
        	width:140px;
        }
        
        .tabs li.is-active a {
   			color: #996ead !important;
   			border-bottom: 2px solid #996ead;
        }
        
        .tabs li {
        	color:#8f8f8f
        }
        
        /* favorit-project*/
        .favoritProject {
        	padding-bottom:0px;
        	position: relative;
        }
        
		.favoritProject::before {
		    content: "";
		    position: absolute;
		    bottom: 0;
		    left: 1%;
		    width: 98%;
		    border-bottom: 1px solid #9c9c9c30;
		}        
        
        
        /* part-project */
        .partProject {
        	padding-top: 25px;
        }
        
        /* 프로젝트 요소 */
        .select-color {
        	margin-left:10px !important;
        }
        .recent-modify {
        	margin-right:10px;
        	font-size:12px;
        	color :#999;
        }
        
		.star {
		    transition: opacity 0.5s ease-in-out;
		}        
		
		.select-color {
			cursor:auto;
		}
		
		.team-count-img {
			margin-left:5px;
			width:21px;
		}
		
		.team-count-span {
			font-size:13px;
		}
		
    </style>
</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->

            <jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <jsp:include page="../mainboard/navbar.jsp"></jsp:include>

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <jsp:include page="../chat/chat.jsp"></jsp:include>

                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">
                            <!-- Total Revenue -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 project-list">
                                <div class="card">
                                    <div class="card-body project-list-card-body">
                                    	<div style="display:flex; justify-content:space-between; align-items: center;">
                                        <h3 style="font-size:27px; font-weight: 800; color:#555">프로젝트</h3>

										<div style="display:flex; align-items: center;">
										<img src="../resources/project/img/projectboard/search.svg" style="margin-right:7px; height:30px; opacity: 0.4;">
                                        <form name="project-search-form" autocomplete="off" method="post">
                                            <div class="search-project">
                                                <div class="search-area">
                                                    <input type="text" class="project-search" id="searchInput" name="searchText" placeholder="프로젝트명을 입력하세요">
                                                </div>
                                            </div>
                                        </form>
                                        </div>
                                        </div>
                                        
										<div class="tabs">
										  <ul>
										    <li class="part-tabs is-active"><a>참여 중</a></li>
										    <li class="all-tabs"><a>전체 프로젝트</a></li>
										  </ul>
										</div>
										
                                        <div class="personalProject">
                                            <div class="favoritProject">

                                                <div class="search-title">
                                                    <span class="search-result-title">즐겨찾기
                                                        <span class="all-project-count"></span>
                                                        <img id="favorit-arrow" src="../resources/project/img/arrow/chevron-down.svg">
                                                    </span>
                                                </div>

                                                <div class="project-area favorit-project">
                                                    <ul class="all-project-list fav-ul">
                                                        <c:forEach var="favoritProject" items="${favoritProjectList}">
                                                            <li class="list fav-list">
                                                                <div class="project-info">
                                                                    <div class="project-left">
                                                                        <a class="select-color" style="background-color: ${favoritProject.COLOR};"></a>
                                                                        <div class="project-information">
                                                                            <div class="project-up">
                                                                                <div class="favorite-project" style="">
                                                                                    <img class="star favorite-star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="${favoritProject.ID}">
                                                                                </div>
                                                                                <div class="setting">
                                                                                    <div class="dropdown">
                                                                                        <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="cardOpt3">
                                                                                            <div class="project-setup-header">
                                                                                                <span>프로젝트 번호</span>
                                                                                                <em id="detailSettingProjectSrno">${favoritProject.ID}</em>
                                                                                            </div>

                                                                                            <div class="setting-menu">
                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-exit"> <img class="setting-img share" src="../resources/project/img/projectboard/share.svg">
                                                                                                        <span class="setting-span">프로젝트 나가기</span>
                                                                                                    </a>

                                                                                                    <div class="tooltip-container">
                                                                                                        <img class="setting-info" src="../resources/project/img/projectboard/info.svg">
                                                                                                        <div class="tooltip-text">프로젝트 나가기 시, 프로젝트
                                                                                                            목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
                                                                                                    </div>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-edit"> <img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">
                                                                                                        <span class="setting-span">프로젝트 수정</span>
                                                                                                    </a>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-delete"> <img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">
                                                                                                        <span class="setting-span">프로젝트 삭제</span>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="project-name">
                                                                                    <a href="project?projectId=${favoritProject.ID}"><span class="project-name-span">${favoritProject.TITLE}</span></a>
                                                                                    <img class="team-count-img" src="../resources/project/img/person.svg">
                                                                                    <span class="team-count-span">${favoritProject.TEAMCOUNT}</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="recent-modify">
                                                                        <c:set var="timeDiff" value="${favoritProject.CURRENTTIME}" />

                                                                        <c:if test="${timeDiff lt 1}">
                                                                            <span>방금 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 1 and timeDiff lt 60}">
                                                                            <span>${timeDiff} 분 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 60 and timeDiff lt 1440}">
                                                                            <span>${Integer.valueOf(timeDiff div 60)} 시간 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (24*60) and timeDiff lt (7*24*60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (24*60))} 일 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (7*24*60))} 주</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="partProject">

                                                <div class="search-title">
                                                    <span class="search-result-title">참여 중
                                                        <span class="all-project-count"></span>
                                                        <img id="part-arrow" src="../resources/project/img/arrow/chevron-down.svg">                                                       
                                                    </span>
                                                </div>

                                                <div class="project-area part-project">
                                                    <ul class="all-project-list part-ul">
                                                        <c:forEach var="partProject" items="${partProjectList}">
                                                        	<input type="hidden" name="projectId" value="${partProject.ID}">
                                                            <li class="list part-list">
                                                                <div class="project-info">
                                                                    <div class="project-left">
                                                                        <a class="select-color" style="background-color: ${partProject.COLOR};"></a>
                                                                        <div class="project-information">
                                                                            <div class="project-up">
                                                                                <div class="favorite-project" style="">
                                                                                    <img class="star favorite-star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="${partProject.ID}">
                                                                                </div>
                                                                                <div class="setting">
                                                                                    <div class="dropdown">
                                                                                        <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="cardOpt3">
                                                                                            <div class="project-setup-header">
                                                                                                <span>프로젝트 번호</span>
                                                                                                <em id="detailSettingProjectSrno">${partProject.ID}</em>
                                                                                            </div>

                                                                                            <div class="setting-menu">
                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-exit"> <img class="setting-img share" src="../resources/project/img/projectboard/share.svg">
                                                                                                        <span class="setting-span">프로젝트 나가기</span>
                                                                                                    </a>

                                                                                                    <div class="tooltip-container">
                                                                                                        <img class="setting-info" src="../resources/project/img/projectboard/info.svg">
                                                                                                        <div class="tooltip-text">프로젝트 나가기 시, 프로젝트
                                                                                                            목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
                                                                                                    </div>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-edit"> <img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">
                                                                                                        <span class="setting-span">프로젝트 수정</span>
                                                                                                    </a>
                                                                                                </div>

                                                                                                <div class="setting-line">
                                                                                                    <a class="setting-anchor setting-delete"> <img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">
                                                                                                        <span class="setting-span">프로젝트 삭제</span>
                                                                                                    </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="project-name">
                                                                                    <a href="project?projectId=${partProject.ID}"><span class="project-name-span">${partProject.TITLE}</span></a>
                                                                                    <img class="team-count-img" src="../resources/project/img/person.svg">
                                                                                    <span class="team-count-span">${partProject.TEAMCOUNT}</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="recent-modify">
                                                                        <c:set var="timeDiff" value="${partProject.CURRENTTIME}" />

                                                                        <c:if test="${timeDiff lt 1}">
                                                                            <span>방금 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 1 and timeDiff lt 60}">
                                                                            <span>${timeDiff} 분 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge 60 and timeDiff lt 1440}">
                                                                            <span>${Integer.valueOf(timeDiff div 60)} 시간 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (24*60) and timeDiff lt (7*24*60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (24*60))} 일 전</span>
                                                                        </c:if>

                                                                        <c:if test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
                                                                            <span>${Integer.valueOf(timeDiff div (7*24*60))} 주</span>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="allProject" style="display:none">

                                            <div class="search-title">
                                                <span class="search-result-title">전체
                                                    <span class="all-project-count"></span>
                                                </span>
                                            </div>

                                            <div class="project-area all-project">
                                                <ul class="all-project-list all-ul">
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- common js -->
    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>

    <script src="../resources/project/js/projectboard/projectboard_Header.js"></script>

    <script>
        $(document).ready(function() {
            
            $('#searchInput').on('keyup', function() {
                var value = $(this).val().toLowerCase();

                if (value === '') {
                    $('.list').show();
                } else {
                    var matchedItems = $('.list').filter(function() {
                        var projectName = $(this).find('.project-name-span').text().toLowerCase();
                        return projectName.indexOf(value) > -1;
                    });

                    $('.list').hide();
                    matchedItems.show();
                }
            });
            
            // list-dropdown
            $('#favorit-arrow').click(function() {
            	  var src = $(this).attr('src');

            	  if (src == '../resources/project/img/arrow/chevron-down.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-up.svg');
            	    $('.favoritProject').css('padding-bottom','25px');
            	    $('.favorit-project').slideUp(500);
            	    
            	  } else if (src == '../resources/project/img/arrow/chevron-up.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-down.svg');
            	    $('.favoritProject').css('padding-bottom',0);
            	    $('.favorit-project').slideDown(500);
            	  }
            });
            
            // list-dropdown
            $('#part-arrow').click(function() {
            	  var src = $(this).attr('src');

            	  if (src == '../resources/project/img/arrow/chevron-down.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-up.svg');
            	    $('.partProject').css('padding-bottom','25px');
            	    $('.part-project').slideUp(500);
            	    
            	  } else if (src == '../resources/project/img/arrow/chevron-up.svg') {
            	    $(this).attr('src', '../resources/project/img/arrow/chevron-down.svg');
            	    $('.partProject').css('padding-bottom',0);
            	    $('.part-project').slideDown(500);
            	  }
            });
            
            // tabs active
			$(".favorite-star").click(function(){
                var $this = $(this);
                var $targetList = $this.closest('li'); // 가장 가까운 상위의 li 찾기

                $targetList.hide();

                setTimeout(function() {
                    $targetList.fadeIn(500);
                }, 500);
            })
			
            // tabs active
            $('.tabs ul li').click(function() {
                var $this = $(this);
                
                $('.tabs ul li').removeClass('is-active');
                
                $this.addClass('is-active');
                
                if ($this.hasClass('part-tabs')) {
                    $.ajax({
                        url: '../project/part-tabs',
                        method: 'GET',
                        success: function(data) {
                        	$('.personalProject').show();
                            $('.allProject').hide();
                        	
							var favList = '';
							var partList = '';
							
							for(var i=0; i< data.favoritProjectList.length; i++) {
								favList += '<li class="list fav-list">';								
								favList += '<div class="project-info">'; 								
								favList += '<div class="project-left">';								
								favList += '<a class="select-color" style="background-color:' + data.favoritProjectList[i].color + ';"></a>';								
								favList += '<div class="project-information">';								
								favList += '<div class="project-up">';								
								favList += '<div class="favorite-project">';								
								favList += '<img class="star favorite-star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="' + data.favoritProjectList[i].id + '">';								
								favList += '</div>';								
								favList += '<div class="setting">';								
								favList += '<div class="dropdown">';								
								favList += '<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';								
								favList += '<i class="bx bx-dots-vertical-rounded" style="margin:0 5px 0 5px"></i>';								
								favList += '</button>';								
								favList += '<div class="dropdown-menu" aria-labelledby="cardOpt3">';								
								favList += '<div class="project-setup-header">';								
								favList += '<span>프로젝트 번호</span>';								
								favList += '<em id="detailSettingProjectSrno">' + data.favoritProjectList[i].id + '</em>';								
								favList += '</div>';								
								favList += '<div class="setting-menu">';								
								favList += '<div class="setting-line">';								
								favList += '<a class="setting-anchor setting-exit">';								
								favList += '<img class="setting-img share" src="../resources/project/img/projectboard/share.svg">';								
								favList += '<span class="setting-span">프로젝트 나가기</span>';								
								favList += '</a>';								
								favList += '<div class="tooltip-container">';								
								favList += '<img class="setting-info" src="../resources/project/img/projectboard/info.svg">';								
								favList += '<div class="tooltip-text">프로젝트 나가기 시, 프로젝트 목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '<div class="setting-line">';								
								favList += '<a class="setting-anchor setting-edit">';								
								favList += '<img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">';								
								favList += '<span class="setting-span">프로젝트 수정</span>';								
								favList += '</a>';								
								favList += '</div>';								
								favList += '<div class="setting-line">';								
								favList += '<a class="setting-anchor setting-delete">';								
								favList += '<img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">';								
								favList += '<span class="setting-span">프로젝트 삭제</span>';								
								favList += '</a>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '<div class="project-name">';								
								favList += '<a href="project?projectId=' + data.favoritProjectList[i].id + '">';								
								favList += '<span class="project-name-span">' + data.favoritProjectList[i].title + '</span>';								
								favList += '</a>';								
								favList += '<img class="team-count-img" src="../resources/project/img/person.svg" style="margin-left:8.5px">';								
								favList += '<span class="team-count-span" style="margin-left:4px">' + data.favoritProjectList[i].teamcount + '</span>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '</div>';								
								favList += '<div class="recent-modify">';
								var timeDiff = data.favoritProjectList[i].currenttime;
								
								if (timeDiff < 1) {
									favList += '<span>방금 전</span>';
								} else if (timeDiff >= 1 && timeDiff < 60) {
									favList += '<span>' + timeDiff + ' 분 전</span>';
								} else if (timeDiff >= 60 && timeDiff < 1440) {
									favList += '<span>' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
								} else if (timeDiff >= 1440 && timeDiff < 10080) {
									favList += '<span>' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
								} else if (timeDiff >= 10080 && timeDiff < 43200) {
								    favList += '<span>' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
								}
								favList += '</div>';
								favList += '</div>';								
								favList += '</li>';								
							}
							
							for(var i=0; i< data.partProjectList.length; i++) {
								partList += '<li class="list part-list">';								
								partList += '<div class="project-info">'; 								
								partList += '<div class="project-left">';								
								partList += '<a class="select-color" style="background-color:' + data.partProjectList[i].color + ';"></a>';								
								partList += '<div class="project-information">';								
								partList += '<div class="project-up">';								
								partList += '<div class="favorite-project">';								
								partList += '<img class="star favorite-star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="' + data.partProjectList[i].id + '">';								
								partList += '</div>';								
								partList += '<div class="setting">';								
								partList += '<div class="dropdown">';								
								partList += '<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';								
								partList += '<i class="bx bx-dots-vertical-rounded" style="margin:0 5px 0 5px"></i>';								
								partList += '</button>';								
								partList += '<div class="dropdown-menu" aria-labelledby="cardOpt3">';								
								partList += '<div class="project-setup-header">';								
								partList += '<span>프로젝트 번호</span>';								
								partList += '<em id="detailSettingProjectSrno">' + data.partProjectList[i].id + '</em>';								
								partList += '</div>';								
								partList += '<div class="setting-menu">';								
								partList += '<div class="setting-line">';								
								partList += '<a class="setting-anchor setting-exit">';								
								partList += '<img class="setting-img share" src="../resources/project/img/projectboard/share.svg">';								
								partList += '<span class="setting-span">프로젝트 나가기</span>';								
								partList += '</a>';								
								partList += '<div class="tooltip-container">';								
								partList += '<img class="setting-info" src="../resources/project/img/projectboard/info.svg">';								
								partList += '<div class="tooltip-text">프로젝트 나가기 시, 프로젝트 목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '<div class="setting-line">';								
								partList += '<a class="setting-anchor setting-edit">';								
								partList += '<img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">';								
								partList += '<span class="setting-span">프로젝트 수정</span>';								
								partList += '</a>';								
								partList += '</div>';								
								partList += '<div class="setting-line">';								
								partList += '<a class="setting-anchor setting-delete">';								
								partList += '<img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">';								
								partList += '<span class="setting-span">프로젝트 삭제</span>';								
								partList += '</a>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '<div class="project-name">';								
								partList += '<a href="project?projectId=' + data.partProjectList[i].id + '"><span class="project-name-span">' + data.partProjectList[i].title + '</span></a>';								
								partList += '<img class="team-count-img" src="../resources/project/img/person.svg" style="margin-left:8.5px">';								
								partList += '<span class="team-count-span" style="margin-left:4px">' + data.partProjectList[i].teamcount + '</span>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '</div>';								
								partList += '<div class="recent-modify">';
								var timeDiff = data.partProjectList[i].currenttime;
								
								if (timeDiff < 1) {
									partList += '<span>방금 전</span>';
								} else if (timeDiff >= 1 && timeDiff < 60) {
									partList += '<span>' + timeDiff + ' 분 전</span>';
								} else if (timeDiff >= 60 && timeDiff < 1440) {
									partList += '<span>' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
								} else if (timeDiff >= 1440 && timeDiff < 10080) {
									partList += '<span>' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
								} else if (timeDiff >= 10080 && timeDiff < 43200) {
								    favList += '<span>' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
								}
								partList += '</div>';
								partList += '</div>';								
								partList += '</li>';								
							}
							
							$('.fav-ul').html(favList);
							$('.part-ul').html(partList);
							
						    $('.star').each(function() {
						        var $this = $(this);
						        var projectId = $this.data('projectId');
						       /* var employeeId = $this.data('employeeId'); */
						        var employeeId = 1;
						        
						        $.ajax({
						            url: '../project/participate',
						            method: 'GET',
						            data: {
						                projectId: projectId,
						                employeeId: employeeId
						            },
						            success: function(response) {
						                if (response == -1) {
						                    $this.attr('src', '../resources/project/img/projectboard/icon_star.png');
						                } else {
						                    $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');
						                }
						            },
								    error: function(xhr, status, error) {
								        console.error('Error:', error);
								    }
						        });
						    });

							$('.favorite-star').click(function() {
							    var $this = $(this);
							    var projectId = $this.data('projectId');
							    /* var employeeId = $this.data('employeeId'); */
							    var employeeId = 1
						       let token = $("meta[name='_csrf']").attr("content");
						       let header = $("meta[name='_csrf_header']").attr("content");			    
							
							    $.ajax({
							        url: '../project/favorite',
							        method: 'POST',
							        data: {
							            projectId: projectId,
							            employeeId: employeeId
							        },
							         beforeSend : function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
							            xhr.setRequestHeader(header, token);
							         },
							        success: function(response) {
							            console.log(response);
							            if(response == -1) {
							
							                $this.attr('src', '../resources/project/img/projectboard/icon_star.png');
							
							                var listItem = $this.closest('.list');
							                listItem.hide();
							                $('.partProject .all-project-list').prepend(listItem);
							                listItem.fadeIn(500);
							
							            } else {
							                $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');
							
							                var listItem = $this.closest('.list');
							
										    listItem.hide();
										    $('.favoritProject .all-project-list').prepend(listItem); // prepend()
										    listItem.fadeIn(500);
										}
									},
									error: function(xhr, status, error) {
									   console.error('Error:', error);
								   }
							   });
							});
							
                        }
                    });
                } else if ($this.hasClass('all-tabs')) { 
                    $.ajax({
                        url: '../project/all-tabs',
                        method: 'GET',
                        success: function(data) {
                        	$('.personalProject').hide();
                            $('.allProject').show(); 
                        	
							var allList = '';
							
							console.log(data);
							
							for(var i=0; i< data.length; i++) {
								allList += '<li class="list">';								
								allList += '<div class="project-info">'; 								
								allList += '<div class="project-left">';								
								allList += '<a class="select-color" style="background-color:' + data[i].color + ';"></a>';								
								allList += '<div class="project-information">';								
								allList += '<div class="project-up">';								
								allList += '<div class="favorite-project">';								
								allList += '<img class="star all-star" src="../resources/project/img/projectboard/icon_star.png" data-project-id="' + data[i].id + '">';								
								allList += '</div>';								
								allList += '<div class="setting">';								
								allList += '<div class="dropdown">';								
								allList += '<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';								
								allList += '<i class="bx bx-dots-vertical-rounded" style="margin:0 5px 0 5px"></i>';								
								allList += '</button>';								
								allList += '<div class="dropdown-menu" aria-labelledby="cardOpt3">';								
								allList += '<div class="project-setup-header">';								
								allList += '<span>프로젝트 번호</span>';								
								allList += '<em id="detailSettingProjectSrno">' + data[i].id + '</em>';								
								allList += '</div>';								
								allList += '<div class="setting-menu">';								
								allList += '<div class="setting-line">';								
								allList += '<a class="setting-anchor setting-exit">';								
								allList += '<img class="setting-img share" src="../resources/project/img/projectboard/share.svg">';								
								allList += '<span class="setting-span">프로젝트 나가기</span>';								
								allList += '</a>';								
								allList += '<div class="tooltip-container">';								
								allList += '<img class="setting-info" src="../resources/project/img/projectboard/info.svg">';								
								allList += '<div class="tooltip-text">프로젝트 나가기 시, 프로젝트 목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '<div class="setting-line">';								
								allList += '<a class="setting-anchor setting-edit">';								
								allList += '<img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">';								
								allList += '<span class="setting-span">프로젝트 수정</span>';								
								allList += '</a>';								
								allList += '</div>';								
								allList += '<div class="setting-line">';								
								allList += '<a class="setting-anchor setting-delete">';								
								allList += '<img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">';								
								allList += '<span class="setting-span">프로젝트 삭제</span>';								
								allList += '</a>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '<div class="project-name">';								
								allList += '<a href="project?projectId=' + data[i].id + '">';								
								allList += '<span class="project-name-span">' + data[i].title + '</span>';								
								allList += '</a>';								
								allList += '<img class="team-count-img" src="../resources/project/img/person.svg" style="margin-left:8.5px">';								
								allList += '<span class="team-count-span" style="margin-left:4px">' + data[i].teamcount + '</span>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '</div>';								
								allList += '<div class="recent-modify">';
								var timeDiff = data[i].currenttime;
								
								if (timeDiff < 1) {
									allList += '<span>방금 전</span>';
								} else if (timeDiff >= 1 && timeDiff < 60) {
									allList += '<span>' + timeDiff + ' 분 전</span>';
								} else if (timeDiff >= 60 && timeDiff < 1440) {
									allList += '<span>' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
								} else if (timeDiff >= 1440 && timeDiff < 10080) {
									allList += '<span>' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
								} else if (timeDiff >= 10080 && timeDiff < 43200) {
									allList += '<span>' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
								}
								allList += '</div>';
								allList += '</div>';								
								allList += '</li>';								
							}
							
							$('.all-ul').html(allList);
							
						    $('.star').each(function() {
						        var $this = $(this);
						        var projectId = $this.data('projectId');
						       /* var employeeId = $this.data('employeeId'); */
						        var employeeId = 1;
						        
						        $.ajax({
						            url: '../project/participate',
						            method: 'GET',
						            data: {
						                projectId: projectId,
						                employeeId: employeeId
						            },
						            success: function(response) {
						                if (response == -1) {
						                    $this.attr('src', '../resources/project/img/projectboard/icon_star.png');
						                } else {
						                    $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');
						                }
						            },
								    error: function(xhr, status, error) {
								        console.error('Error:', error);
								    }
						        });
						    });
						    
							$('.all-star').click(function() {
							    var $this = $(this);
							    var projectId = $this.data('projectId');
							    /* var employeeId = $this.data('employeeId'); */
							    var employeeId = 1
						       let token = $("meta[name='_csrf']").attr("content");
						       let header = $("meta[name='_csrf_header']").attr("content");			    
							
							    $.ajax({
							        url: '../project/favorite',
							        method: 'POST',
							        data: {
							            projectId: projectId,
							            employeeId: employeeId
							        },
							         beforeSend : function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
							            xhr.setRequestHeader(header, token);
							         },
							        success: function(response) {
							            console.log(response);
							            if(response == -1) {
							                $this.attr('src', '../resources/project/img/projectboard/icon_star.png');
							            } else {
							                $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');
							                var listItem = $this.closest('.list');
										}
									},
									error: function(xhr, status, error) {
									   console.error('Error:', error);
								   }
							   });
							});
                        }
                    });
                }
            });
            
        });
        
    </script>

</body>

</html>