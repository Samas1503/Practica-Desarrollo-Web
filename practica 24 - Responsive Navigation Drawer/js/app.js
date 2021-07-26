document.querySelector('.toggle').onclick = function() {
    this.classList.toggle('active');
    document.querySelector('.navigation').classList.toggle('active');
}