const logo = document.querySelector(".logo")

logo.addEventListener('click', function (event) {
    if (event.detail === 5) {
        alert('YOU FOUND THE EASTER EGG');
    }
});

// this currently does not work
