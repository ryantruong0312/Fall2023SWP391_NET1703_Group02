<%-- 
    Document   : feedback
    Created on : Sep 26, 2023, 8:34:09 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container mt-5">
    <div class="mt-3 feedback">
        <c:if test="${not empty requestScope.feedbackList}">
            <div class="row">
                <c:set var="ratingCustomer" value="${requestScope.starCustomer}" />
                <h6 class="feedback-title" >Khách hàng đánh giá</h6>
                <div class="col-m-6 col-sm-6 col-md-5 col-lg-4 col-xl-3 my-3 total-left">
                    <div class="my-3">Tổng quan</div>
                    <div class="d-flex align-items-center">
                        <h5 class="mr-4 rating-total"><c:out value="${ratingCustomer.totalRating()}"/></h5>
                        <div class="rating big-star">
                            <c:forEach begin="0" end="5" step="1" varStatus="loopIndex">
                                <c:if test="${loopIndex.index < ratingCustomer.totalRating()}">
                                    <span class="fa fa-star star-checked"></span>
                                </c:if>
                                <c:if test="${loopIndex.index > ratingCustomer.totalRating()}">
                                    <span class="fa fa-star"></span>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <p class="mt-2 text-muted">(<c:out value="${ratingCustomer.totalStar()}"/> đánh giá)</p>
                    <div class="mt-2 pb-3 review-detail">
                        <div class="d-flex align-items-center">
                            <div class="rating">
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                            </div>
                            <div class="rating-range">
                                <div style="width:<c:out value="${ratingCustomer.percentFiveStar()}"/>%" class="range-color">              
                                </div>
                            </div>
                            <span class="text-muted ml-2 user-select-none"><c:out value="${ratingCustomer.fiveStar}"/></span>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="rating">
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star "></span>
                            </div>
                            <div class="rating-range">
                                <div style="width:<c:out value="${ratingCustomer.percentFourStar()}"/>%" class="range-color">              
                                </div>
                            </div>
                            <span class="text-muted ml-2 user-select-none"><c:out value="${ratingCustomer.fourStar}"/></span>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="rating">
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star "></span>
                                <span class="fa fa-star"></span>
                            </div>
                            <div class="rating-range">
                                <div style="width:<c:out value="${ratingCustomer.percentThreeStar()}"/>%" class="range-color">              
                                </div>
                            </div>
                            <span class="text-muted ml-2 user-select-none"><c:out value="${ratingCustomer.threeStar}"/></span>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="rating">
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                            </div>
                            <div class="rating-range">
                                <div style="width:<c:out value="${ratingCustomer.percentTwoStar()}"/>%" class="range-color">              
                                </div>
                            </div>
                            <span class="text-muted ml-2 user-select-none"><c:out value="${ratingCustomer.twoStar}"/></span>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="rating">
                                <span class="fa fa-star star-checked"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                            </div>
                            <div class="rating-range">
                                <div style="width:<c:out value="${ratingCustomer.percentOneStar()}"/>%" class="range-color">              
                                </div>
                            </div>
                            <span class="text-muted ml-2 user-select-none"><c:out value="${ratingCustomer.oneStar}"/></span>
                        </div>
                    </div>
                </div>
                <div class="col-m-6 col-sm-6 col-md-7 col-lg-8 col-xl-9">
                    <c:forEach var="feedback" items="${requestScope.feedbackList}">
                        <div class="mx-4 mt-4 user-comment">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="mb-2 font-weight-bold"><c:out value="${feedback.fullName}"/></h6>
                                    <div class="rating">
                                        <c:forEach begin="0" end="5" step="1" varStatus="loopIndex">
                                            <c:if test="${loopIndex.index < feedback.rating}">
                                                <span class="fa fa-star star-checked"></span>
                                            </c:if>
                                            <c:if test="${loopIndex.index > feedback.rating}">
                                                <span class="fa fa-star"></span>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-muted user-select-none"><c:out value="${feedback.feedbackDate}   "/></p>
                                </div>
                            </div>
                            <p class="mt-2"><c:out value="${feedback.comment}"/></p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>   
</div>

