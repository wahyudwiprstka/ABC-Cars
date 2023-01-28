function validatePostCarForm(){
    var make = document.forms["pcForm"]["make"].value;
    var model = document.forms["pcForm"]["model"].value;
    var year = document.forms["pcForm"]["year"].value;
    var price = document.forms["pcForm"]["price"].value;
    // var image = document.forms["myForm"]["upload-image"].value;

    if (make == "") {
        alert("Make must be filled out");
        return false;
    }
    if (model == "") {
        alert("Model must be filled out");
        return false;
    }
    if (year == "") {
        alert("Year must be filled out");
        return false;
    }
    if (price == "") {
        alert("Price must be filled out");
        return false;
    }
    // if (image == "") {
    //     alert("Image must be filled out");
    //     return false;
    // }
}