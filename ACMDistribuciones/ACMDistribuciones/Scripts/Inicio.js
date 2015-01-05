$(document).ready(function () {
    $("#acor").accordion({ collapsible: true, active: false });

    $('#proveedoresProd').click(function () {
        $('#acor').toggle('blind');
    });

    //funcion que aparece el nav de Categoria
    $('#Categoria').click(function () {
        $('.acor, #forPedido, #forCrearCat, #forEntrada, #reportes, #navInv, #forEliProv, #navProv, .forEditar, .forEliminar, #forCrearProd,#navProd, #forEdiProd, #forEliProd, #forEdiProv').fadeOut('fast');
        $('#navCat').toggle('blind');
    });

    //Funcion que aparece el formulario para crear Categorias
    $('#crearCat').click(function () {
        $('.forEditar, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forEdiProv').fadeOut('fast');
        $('#forCrearCat').toggle('blind');
    });

    //Funcion que aparece el formulario para editar Categorias
    $('#editarCat').click(function () {
        $('#forCrearCat, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forEdiProv').fadeOut('fast');
        $('.forEditar').toggle('blind');
    });

    //Funcion que aparece el formulario para eliminar Categorias
    $('#eliminarCat').click(function () {
        $('#forCrearCat, .forEditar, #forCrearProd, #forEdiProd, #forEliProd, #forEdiProv').fadeOut('fast');
        $('.forEliminar').toggle('blind');
    });

    //Funcion para cerrar los formularios
    $('.A1').click(function () {
        $('#forPedido, #reportes, #forCrearCat, #forEntrada, .forEditar, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forEliProd, #forCrearProv, #forEliProv, #forEdiProv').hide('puff');
    });

    //------------------------------------------------------------------------------------------
    //Funcion que aparece el nav de Productos
    $('#Producto').click(function () {
        $('#acor, #forPedido, #forEntrada, #navCat, #reportes, #navInv, #forEliProv, #navProv, #forCrearCat, .forEditar, .forEliminar, #forCrearProd, #forEdiProd,#forEdiProv, #forEliProd').fadeOut('fast');
        $('#navProd').toggle('blind');
    });

    $('#acordeon').hover(function () {
        $('#acor').toggle('blind');
    });

    //Funcion que aparece el formulario para crear Productos
    $('#crearProd').click(function () {
        $('#acor, #forCrearCat, .forEditar, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forEdiProv').hide('blind');
        $('#forCrearProd').toggle('blind');
    });

    //Funcion que aparece el formulario para editar Productos
    $('#editarProd').click(function () {
        $('#acor, #forCrearCat, .forEditar, .forEliminar, #forCrearProd,#forEdiProv, #forEliProd').fadeOut('fast');
        $('#forEdiProd').toggle('blind');
    });

    //Funcion que aparece el formulario para eliminar Productos
    $('#eliminarProd').click(function () {
        $('#acor #forCrearCat, .forEditar, .forEliminar, #forCrearProd,#forEdiProv, #forEdiProd').fadeOut('fast');
        $('#forEliProd').toggle('blind');
    });

    //---------------------------------------------------------------------------------------------------------------
    //Funcion que aparece el navegador de Proveedores
    $('#Proveedor').click(function () {
        $('#acor, #forPedido, #forEntrada, #navCat, #reportes, #navInv, #forCrearCat, #navProd, .forEditar, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forEdiProv').fadeOut('fast');
        $('#navProv').toggle('blind');
    });

    //Funcion que aparece el formulario para crear Proveedores
    $('#crearProv').click(function () {
        $('#forCrearCat, .forEditar, .forEliminar, #forEliProv, #forCrearProd, #navProd, #forEdiProd, #forEliProd, #navCat, #forEdiProv').hide('blind');
        $('#forCrearProv').toggle('blind');
    });

    //Funcion que aparece el formulario para la edicion de los Proveedores
    $('#editarProv').click(function () {
        $('#navCat, #forCrearCat, #navProd,#forEliProv, .forEditar, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forCrearProv').fadeOut('fast');
        $('#forEdiProv').toggle('blind');
    });

    //Funcion que aparece el formulario para la eliminacion de Proveedores
    $('#eliminarProv').click(function () {
        $('#navCat, #forCrearCat, #navProd, .forEditar, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forCrearProv, #forEdiProv').fadeOut('fast');
        $('#forEliProv').toggle('blind');
    });

    //Funcion que aparece el navegador de Inventario-----------------------------------------------------------------------
    $('#Inventario').click(function () {
        $('#acor, #forEntrada, #navCat, #reportes, #navCat, #navProv, #forEliProv, #forCrearCat, #navProd, .forEditar, .forEliminar, #forCrearProd, #forEdiProd, #forEliProd, #forCrearProv, #forEdiProv').fadeOut('fast');
        $('#navInv').toggle('blind');
    });

    //Funcion que aparece el formulario de las entradas
    $('#entrada').click(function () {
        $('#forPedido').fadeOut('fast');
        $('#forEntrada').toggle('blind');
    });

    //Funcion que aparece el formulario de Salidas
    $('#pedido').click(function () {
        $('#forEntrada').fadeOut('fast');
        $('#forPedido').toggle('blind');
    });

    //Funcion que aparece las opciones de reportes--------------------------------------------------------------------
    $('#Reporte').click(function () {
        $('#acor, #navCat, x#forPedido, #forCrearCat, #forEntrada, #reportes, #navInv, #forEliProv, #navProv, .forEditar, .forEliminar, #forCrearProd,#navProd, #forEdiProd, #forEliProd, #forEdiProv').fadeOut('fast');
        $('#reportes').toggle('blind');
    });

    //Funcion para aparecer el resultado de la busqueda de los productos
    $('.btnBuscador').click(function () {
        $('#tituloResBus').toggle('fold');
    });

});

