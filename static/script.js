document.addEventListener('DOMContentLoaded', function() {
    // Seleciona apenas as categorias com a classe 'toggle'
    const toggleCategories = document.querySelectorAll('.category.toggle');
    
    toggleCategories.forEach(category => {
        category.addEventListener('click', function(e) {
            e.preventDefault(); // Impede o comportamento padrão do link
            
            // Deixa ativo texto
            category.classList.toggle('active');
            
            //Deixa a subcategoria associada a categoria
            const submenu = category.nextElementSibling;
            
            // Abre o submenu
            if (submenu.style.display === 'block') {
                submenu.style.display = 'none';
            } else {
                submenu.style.display = 'block';
            }
        });
    });
});