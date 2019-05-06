'use strict';

/////////////////////////////////////////////////////////////////////////////////////////
// FONCTIONS                                                                           //
/////////////////////////////////////////////////////////////////////////////////////////

//HEADER EFFECTS
$(".navIcons").hover(function() {
    /* Stuff to do when the mouse enters the element */
    $(this).find('p').fadeIn(500);

}, function() {
    $(this).find('p').fadeOut(200);
});

$(window).scroll(function() {
if ($(this).scrollTop() > 1){  
    $('header').addClass("headerDown");
  }
  else{
    $('header').removeClass("headerDown");
  }
});

//MEALS SETUP


$.getJSON(getRequestUrl()+"/ordermeals?id=1", onReturnMeal);

var globalMeal;
var meals = loadDataFromDomStorage("panier");
var totalAmount = 0;

if(meals == null)
    meals = [];

display();

$("#meal").on("change", onChangeMeal);
onChangeMeal();
function onChangeMeal(){
    var id = $("#meal :selected").val();
    $.getJSON(getRequestUrl()+"/Ordermeals?id="+id, onReturnMeal);
}

function onReturnMeal(meal){
    console.log("ok !");
    globalMeal = meal;
    $("#meal-details img").attr("src",getWwwUrl()+"/images/meals/"+meal.photo);
    $("#meal-details p").text(meal.description);
    $("#meal-details strong").text(meal.salePrice);
}

$("#add").on("click", function() {
    meals = loadDataFromDomStorage("panier");
    if(meals == null)
        meals = [];
    let quantity = parseInt($("#quantity").val());
    globalMeal.quantity = quantity;
    var mealFound;
    for(let meal of meals){
        if(meal.name == globalMeal.name) {
            mealFound = meal;
        }
    }
	if(mealFound){
		mealFound.quantity += globalMeal.quantity;
    }else{
        meals.push(globalMeal);
    }
    saveDataToDomStorage("panier", meals);
    display();
});

$(".killCart").on("click", function() {
    localStorage.clear();
    meals = [];
    display();
});

function validateOrder(e) {
    e.preventDefault();
    if(meals.length == 0) {
        alert("Votre panier est vide !");
        return;
    }
    console.log(totalAmount);
    $.post(getRequestUrl()+"/order", {panier:meals, totalAmount:totalAmount}, function(result){
        $("#ici").html(result);
        var id = JSON.parse(result);
        window.location.assign(getRequestUrl()+"/validation?id="+id);
        console.log("kouskious");
    });
}

function getTheHellOut() {
    alert("Vous devez être connecté(e) pour accéder à cette page");
    window.location.assign(getRequestUrl());
}
function getTheHellOutNoText() {
    alert("Vous ne pouvez pas accéder à cette page en étant déja connecté(e)");
    window.location.assign(getRequestUrl());
}

function display(){
    $("#meals tbody").empty();
    totalAmount = 0;
    for(var meal of meals){
        // RECAP ORDER
        var tr = $("<tr>");
        var tdQuantity = $("<td>");
        var tdName = $("<td>");
        var tdSalePrice = $("<td>");
        var tdTotalPrice = $("<td>");
        tdQuantity.text(meal.quantity);
        tdName.text(meal.name);
        tdSalePrice.text(meal.salePrice+" € ");
        tdTotalPrice.text((parseFloat(meal.salePrice)*meal.quantity));
        tdTotalPrice.append(' € ')
        totalAmount += parseFloat(meal.salePrice)*meal.quantity;
        tr.append(tdQuantity, tdName, tdSalePrice, tdTotalPrice);
        $("#meals tbody").append(tr);
    }
    $('#meals strong').html(totalAmount+" € ");
    $('#subCart').html(totalAmount+"€");
    $("#cartNumber").html(meals.length);
}

/////////////////////////////////////////////////////////////////////////////////////////
// CODE PRINCIPAL                                                                      //
/////////////////////////////////////////////////////////////////////////////////////////


$("header").hide().fadeIn(3000);
$("button").hide().fadeIn();