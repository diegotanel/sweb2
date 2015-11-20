var ready = function() {
  
    // function cargar_evento_boton_agregar_insitucion_de_apoyo()
    // {    
    //   $('#agregar_institucion_de_apoyo').click(function(){
    //     agregar_institucion_de_apoyo($('#institucion').val(), $('#estado_de_apoyo').val());
    //   });
    // }

    //  cargar_evento_boton_agregar_insitucion_de_apoyo();

    // function agregar_institucion_de_apoyo(institucion, estado_de_apoyo)
    // {   
    //   urlToSubmit = "/funcionamiento_salas_v2/"+$('#funcionamiento_sala_v2_id').val()+"/agregar_institucion_de_apoyo"  
    //   $.ajax({
    //     type: "post",
    //     dataType: "json",
    //     url: urlToSubmit,      
    //     data: { institucion: institucion, estado_de_apoyo: estado_de_apoyo },        
    //     success: function(data){
    //           //BlanquearCampos();
    //           $('#div_datos_instituciones_que_dieron_apoyo').html(data);
    //             //cargar_evento_boton_agregar_insitucion_de_apoyo();
    //     },
    //     error: function (request, status, error) 
    //         {             
    //           alert("Hay campos inválidos ingresados. Ha ocurrido un error");
    //         }
    //   });       
    // }
              
};

$(document).ready(ready);
$(document).on('page:load', ready);         
