const stars = document.querySelectorAll('.star')

const addStar = (element) => {
	element.classList.add("glyphicon-star");
	element.classList.remove("glyphicon-star-empty");
	const next = element.previousElementSibling;
	if (next.classList.contains('glyphicon-star-empty')) {
		addStar(next);
	};
};

const removeStar = (element) => {
	if (element.nextElementSibling.classList.contains("glyphicon-star")) {
		element.nextElementSibling.classList.remove("glyphicon-star");
		element.nextElementSibling.classList.add("glyphicon-star-empty");
	};
	removeStar(element.nextElementSibling);
}

if (stars) {
	stars.forEach(function(element) {	
		element.addEventListener("mouseover", event => {
			addStar(element);
			removeStar(element);
		});
	});
};


