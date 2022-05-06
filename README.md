# Código Control 2

Este repositorio contiene el código de una tienda donde usuarios pueden comprar productos. Cada usuario puede elegir productos e irlos agregando a su carro de compras. Además, se podrán activar cupones para cada categoría de productos, los que aplicarán un pequeño descuento sobre el valor de los productos de esa categoría. Una vez que un usuario completa su compra, podrá hacer *checkout* y pagar por el total de los productos en el carrito. 

El programa contiene los siguientes archivos:

* `product.rb`: Clase para representar a cada producto, con su nombre, precio y cantidad en stock, además de su categoría.
* `product_manager.rb`: Clase para controlar la comunicación entre clases externas y los atributos de los productos.
* `shopping_cart.rb`: Clase para representar el carro de compras de un cliente junto con sus cupones. Además, calcula el valor final de la compra actual del usuario.
* `user.rb`: Clase para representar a cada usuario, con su nombre, dirección, métodos de pago y carro de compras actual.

En la rama principal se encuentra el código en su estado inicial, sobre el cual deberá proponer cambios en la P1 del control y proponer tests para una función específica en la P3 del control.
