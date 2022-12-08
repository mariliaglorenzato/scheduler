// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


$(function () {
    $("#add_input_guest").click(function (e) {
        e.preventDefault()
        console.log("hi")
        var x = document.createElement("INPUT");
        x.setAttribute("type", "text");
        x.setAttribute("name", "guest_emails[]");
        x.setAttribute("placeholder", "ex: email@email.com");
        x.setAttribute("class", "guest_emails_list");

        document.getElementById("guest_field_div").appendChild(document.createElement("br"));
        document.getElementById("guest_field_div").appendChild(x);
    })
})