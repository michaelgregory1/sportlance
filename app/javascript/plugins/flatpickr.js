import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!

flatpickr(".datepicker", {
  altInput: true,
  minDate: "today",
  dateFormat: "Y-m-d",
  enable: JSON.parse(document.getElementById("available_days").dataset.array)
})
