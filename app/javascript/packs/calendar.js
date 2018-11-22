const blocks = document.querySelectorAll(".hour-block")

function changeText() {
  const unavailables = document.querySelectorAll(".unavailable")
  const availables = document.querySelectorAll(".available")
  const bookeds = document.querySelectorAll(".booked")
  availables.forEach(function(element) {
    element.innerHTML = "<p>Available</p>";
  });
  unavailables.forEach(function(element) {
    element.innerHTML = "<p>Unavailable</p>";
  });
  bookeds.forEach(function(element) {
    element.innerHTML = "<p>Booked</p>";
  });
};

changeText()

blocks.forEach(function(element) {
  element.addEventListener("click", (event) => {
    if (!event.toElement.classList.contains("booked")) {
      mydata = `time[value]=${event.toElement.id}`
      Rails.ajax({
        type: "POST",
        url: "/toggle-availability",
        data: mydata
      });
    };
    if (event.toElement.classList.contains("booked")) {
      mydata = `time[value]=${event.toElement.id}`
      Rails.ajax({
      type: "POST",
      url: "/redirect-to-show",
      data: mydata
    });
    }
    if (!event.toElement.classList.contains("booked")) {
      element.classList.toggle("unavailable");
      element.classList.toggle("available");
      changeText();
    };
  });
});





