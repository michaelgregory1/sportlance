import $ from 'jquery'

let mydata
const blocks = document.querySelectorAll(".hour-block")

function changeText() {
  const unavailables = document.querySelectorAll(".unavailable")
  const availables = document.querySelectorAll(".available")
  const bookeds = document.querySelectorAll(".booked")
  availables.forEach(function(element) {
    element.innerHTML = "<p>Available</p>";
  });
  unavailables.forEach(function(element) {
    element.innerHTML = "<p></p>";
  });
  bookeds.forEach(function(element) {
    element.innerHTML = "<p>Booked</p>";
  });
};

changeText()

const calendar = document.querySelector(".calendar")
if (calendar) {
  calendar.scrollTo(0, 150);
};

blocks.forEach(function(element) {
  element.addEventListener("mouseover", (event) => {
    if (event.currentTarget.classList.contains("booked")) {
      event.currentTarget.innerHTML = "<p>Go to booking</p>";
    }
  });
  element.addEventListener("mouseleave", (event) => {
    if (event.currentTarget.classList.contains("booked")) {
      event.currentTarget.innerHTML = "<p>Booked</p>";
    }
  });
});

$(blocks).mousedown(e  => {
  if (e.currentTarget.classList.contains('unavailable')) {
    $('.unavailable').mouseenter(e => {
      mydata = `time[value]=${event.toElement.id}`
      Rails.ajax({
        type: "POST",
        url: "/toggle-availability",
        data: mydata
      });
      e.currentTarget.classList.toggle("unavailable");
      e.currentTarget.classList.toggle("available");
      changeText()
    })
  } else if (e.currentTarget.classList.contains('available')) {
    $('.available').mouseenter(e => {
      mydata = `time[value]=${event.toElement.id}`
      Rails.ajax({
        type: "POST",
        url: "/toggle-availability",
        data: mydata
      });
      e.currentTarget.classList.toggle("unavailable");
      e.currentTarget.classList.toggle("available");
      changeText()
    })
  }
  if (!e.currentTarget.classList.contains("booked")) {
    mydata = `time[value]=${event.toElement.id}`
    Rails.ajax({
      type: "POST",
      url: "/toggle-availability",
      data: mydata
    });
    e.currentTarget.classList.toggle("unavailable");
    e.currentTarget.classList.toggle("available");
    changeText()
    $(document).mouseup(e => {
      console.log('I worked because I am Good Code(tm)')
      $('.available').off('mouseenter')
      $('.unavailable').off('mouseenter')
      $(document).off('mouseup')
    });
  };
})

blocks.forEach(function(element) {
  element.addEventListener("click", (event) => {
    if (event.toElement.classList.contains("booked")) {
      event.currentTarget.innerHTML = "<p>Go to booking</p>";
      mydata = `time[value]=${event.toElement.id}`
      Rails.ajax({
        type: "POST",
        url: "/redirect-to-show",
        data: mydata
      });
    };
  });
});

// blocks.forEach(function(element) {
//   element.addEventListener("click", (event) => {
//     const availables = document.querySelectorAll(".available")
//     if (availables.length === 168) {
//       window.location = "https://www.youtube.com/watch?v=710e9ZSYtdM";
//     };
//   });
// });
