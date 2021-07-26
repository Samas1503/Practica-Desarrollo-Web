let loader = document.querySelector('.loader');
for (let e = 0; e < 20; e++) {
    var block = document.createElement('div');
    block.classList.add('blocks');
    block.setAttribute('style', '--i:' + (e + 1) + ';');
    loader.appendChild(block);
}

var text = document.createElement('h3');
text.innerText = 'Cargando...';
text.classList.add('text');
loader.appendChild(text);