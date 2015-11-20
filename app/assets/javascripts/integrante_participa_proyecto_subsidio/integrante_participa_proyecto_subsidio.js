var ready = function() {


  // function agregar_integrante_proyecto_subsidio(nombre_y_apellido, proyecto_en_el_que_participa, tipo_de_subsidio)
  //   {   
  //   urlToSubmit = "/funcionamiento_salas_v2/"+$('#funcionamiento_sala_v2_id').val()+"/agregar_integrante_proyecto_subsidio"  
  //   $.ajax({
  //     type: "post",
  //     dataType: "json",
  //     url: urlToSubmit,      
  //     data: { nombre_y_apellido: nombre_y_apellido, proyecto_en_el_que_participa: proyecto_en_el_que_participa, tipo_de_subsidio: tipo_de_subsidio },        
  //     success: function(data){
  //           //BlanquearCampos();
  //           $('#div_datos_integrantes_que_participan_en_otro_proyecto').html(data);
  //             cargar_evento_boton_agregar_integrante();
  //     },
  //     error: function (request, status, error) 
  //         {             
  //           alert("Hay campos inválidos ingresados. Ha ocurrido un error");
  //         }
  //   });       
  // }

  // function cargar_evento_boton_agregar_integrante()
  // {    
  //   $('#agregar_integrante_proyecto_subsidio').click(function(){
  //         agregar_integrante_proyecto_subsidio($('#nombre_y_apellido').val(), $('#proyecto_en_el_que_participa').val(), $('#tipo_subsidio_solicitado').val());
  //   });
  // }
              
};

$(document).ready(ready);
$(document).on('page:load', ready);         



