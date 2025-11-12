document.addEventListener("DOMContentLoaded", () => {
    const navItems = document.querySelectorAll(".sidebar ul li")
    const sections = document.querySelectorAll("section")
  
    navItems.forEach((item) => {
      item.addEventListener("click", function (e) {
        e.preventDefault()
        const target = this.querySelector("a").getAttribute("href").substring(1)
  
        navItems.forEach((navItem) => navItem.classList.remove("active"))
        this.classList.add("active")
  
        sections.forEach((section) => {
          section.classList.remove("active")
          if (section.id === target) {
            section.classList.add("active")
          }
        })
      })
    })
  
    // Handle booking cancellation
    const cancelButtons = document.querySelectorAll(".btn-danger")
    cancelButtons.forEach((button) => {
      button.addEventListener("click", function () {
        if (confirm("Are you sure you want to cancel this booking?")) {
          // Here you would typically send a request to your server to cancel the booking
          alert("Booking cancelled successfully!")
          this.closest("tr").remove()
        }
      })
    })
  
    // Handle form submissions
    const forms = document.querySelectorAll("form")
    forms.forEach((form) => {
      form.addEventListener("submit", (e) => {
        e.preventDefault()
        // Here you would typically send the form data to your server
        alert("Form submitted successfully hi!")
      })
    })
   })
  
  