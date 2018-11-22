const blocks = document.querySelectorAll(".hour-block")

function changeText() {
  const unavailables = document.querySelectorAll(".unavailable")
  const availables = document.querySelectorAll(".available")
  availables.forEach(function(element) {
    element.innerHTML = "<p>Available</p>";
  });
  unavailables.forEach(function(element) {
    element.innerHTML = "<p>Unavailable</p>";
  });
};

changeText()

blocks.forEach(function(element) {
  element.addEventListener("click", (event) => {
    mydata = `time[value]=${event.toElement.id}`
    Rails.ajax({
      type: "POST",
      url: "/toggle-availability",
      data: mydata
    });
    element.classList.toggle("unavailable");
    element.classList.toggle("available");
    changeText();
  });
});





