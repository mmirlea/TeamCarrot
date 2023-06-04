
// let spanTitle = document.getElementsById("divTitle");
// let spanTitle = document.getElementsByClassName("divTitle");
let spanTitle = document.querySelector(".divTitle");

spanTitle.onclick = function(){
    alert("aaaa");
}



ClassicEditor
    .create( document.querySelector( '#editor' ), {
        plugins: [ Title, /* ... */ ],
        title: {
            placeholder: 'My custom placeholder for the title'
        },
        placeholder: 'My custom placeholder for the body'
    } )
    .then( /* ... */ )
    .catch( /* ... */ );
