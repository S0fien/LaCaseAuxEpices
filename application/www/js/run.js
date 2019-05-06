var colors = ["rgb(187, 148, 122)",
"rgb(209, 147, 77)",
"rgb(50, 110, 104)",
"rgb(226, 228, 211)",
"rgb(233, 178, 35)",
"rgb(192, 92, 32)",
"rgb(236, 225, 216)",
"rgb(216, 200, 153)",
"rgb(219, 195, 124)",
"rgb(203, 144, 68)",
"rgb(201, 195, 203)",
"rgb(178, 64, 67)"];

$("main").css('width', '100%');
$(".item").each(function(index, el) {
	el.style.background = colors[index];
});
$('.carousel').carousel();