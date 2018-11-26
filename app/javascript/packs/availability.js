const date = document.getElementById("availabilities")
date.addEventListener("input", (element) => {
  mydata = `date=${date.value}`
  const id = document.getElementById('user').dataset.userid
  Rails.ajax({
    type: "get",
    url: `/availabilities/${id}`,
    data: mydata
  });
})
