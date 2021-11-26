// Plug-in do jQuery/owl-carousel para aplicar o carrossel com as imagens // 

$('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    // tirando os botões de navegação, logo abaixo da imagem //
    nav:false,
    // os itens são ajustáveis de acordo com o tamanho da tela //
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
    }
})