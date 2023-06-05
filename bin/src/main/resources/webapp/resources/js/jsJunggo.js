var categoryBtn = document.querySelectorAll('.categoryBtn');

const categoryBtn = document.querySelectorAll('.categoryBtn');
categoryBtn.forEach(filter => {
  filter.addEventListener('click', () => {
    filter.classList.toggle('active');
    
     if(filter.classList.contains('active')){
         filter.classList.add('active');
     }else{
       filter.classList.remove('active');
    }
  })
});
