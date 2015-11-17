var ready = function() {

  setear_control_fecha("funcionamiento_sala_v2_fecha_inicio_sala");
  setear_control_fecha("funcionamiento_sala_v2_fecha_del_ultimo_periodo_subsidiado_desde");
  setear_control_fecha("funcionamiento_sala_v2_fecha_del_ultimo_periodo_subsidiado_hasta");


  function setear_control_fecha(nombre_control) 
  {
    var currentDate = new Date();

    $('#'+nombre_control).datepicker
    ({
      showOn: 'both',  
      autoclose: true,    
      format: 'dd/mm/yyyy',
      language: "es"
    });

    //$('#'+nombre_control).datepicker("setDate", currentDate);
  }

  $('#agregar_registro_de_plan').click(function()
  {
      agregar_registro_de_plan($('#funcionamiento_sala_v2_id').val(), $('#rubro').val(), $('#monto').val());
  });

  function agregar_registro_de_plan(funcionamiento_sala_id, rubro, monto)
  {   
    $.ajax({
      type: "post",
      dataType: "json",
      url: "/funcionamiento_salas_v2/traer_registro_de_plan_de_gasto",      
      data: { funcionamiento_sala_id: funcionamiento_sala_id, rubro: rubro, monto: monto },        
      success: function(data){
            //BlanquearCampos();
            $('#titulo').html("<b> Registros de plan de pagos </b>");
            $('#tabla_registro_de_pagos').html(data);
      },
      error: function (request, status, error) 
          {             
            alert("Hay campos inválidos ingresados. Ha ocurrido un error");
          }
    });       
  }
  
   $('#funcionamiento_sala_v2_solicitud_de_subsidio_por_primera_vez_false').change(function() {
        var urlToSubmit = ""       
        var partial_name = "datos_subsidio_primera_vez";
        //$( ".fields_nacionalidad" ).remove(); 
        urlToSubmit = "/funcionamiento_salas_v2/pegar_form_datos_subsidio_primera_vez"                
        $.ajax({  
        url: urlToSubmit,
        type: "POST",
        data: { partial_name: partial_name},
        success:function(result) 
            {  
              $("#div_datos_subsidio_primera_vez").html(result) 
              setear_control_fecha("funcionamiento_sala_v2_fecha_del_ultimo_periodo_subsidiado_desde");
              setear_control_fecha("funcionamiento_sala_v2_fecha_del_ultimo_periodo_subsidiado_hasta");
            }
        });                                          
    });   

    $('#funcionamiento_sala_v2_solicitud_de_subsidio_por_primera_vez_true').change(function() {
        $("#div_datos_subsidio_primera_vez").html("");
    });   

    /*************************************************************/


    $('#algun_integrante_participa_true').change(function() {
        var urlToSubmit = ""       
        var partial_name = "datos_integrantes_que_participan_en_otro_proyecto";
        //$( ".fields_nacionalidad" ).remove(); 
        urlToSubmit = "/funcionamiento_salas_v2/"+$('#funcionamiento_sala_v2_id').val()+"/pegar_form_datos_integrantes_que_participan_en_otro_proyecto"                
        $.ajax({  
        url: urlToSubmit,
        type: "POST",
        data: { partial_name: partial_name },
        success:function(result) 
            {  
              $("#div_datos_integrantes_que_participan_en_otro_proyecto").html(result);
               cargar_evento_boton_agregar_integrante();
            }
        });                                          
    });
                                
    $('#algun_integrante_participa_false').change(function() {
        $("#div_datos_integrantes_que_participan_en_otro_proyecto").html("");
         cargar_evento_boton_agregar_integrante();
    });               


    function agregar_integrante_proyecto_subsidio(nombre_y_apellido, proyecto_en_el_que_participa, tipo_de_subsidio)
    {   
    urlToSubmit = "/funcionamiento_salas_v2/"+$('#funcionamiento_sala_v2_id').val()+"/agregar_integrante_proyecto_subsidio"  
    $.ajax({
      type: "post",
      dataType: "json",
      url: urlToSubmit,      
      data: { nombre_y_apellido: nombre_y_apellido, proyecto_en_el_que_participa: proyecto_en_el_que_participa, tipo_de_subsidio: tipo_de_subsidio },        
      success: function(data){
            //BlanquearCampos();
            $('#div_datos_integrantes_que_participan_en_otro_proyecto').html(data);
              cargar_evento_boton_agregar_integrante();
      },
      error: function (request, status, error) 
          {             
            alert("Hay campos inválidos ingresados. Ha ocurrido un error");
          }
    });       
  }

  function cargar_evento_boton_agregar_integrante()
  {    
    $('#agregar_integrante_proyecto_subsidio').click(function(){
          agregar_integrante_proyecto_subsidio($('#nombre_y_apellido').val(), $('#proyecto_en_el_que_participa').val(), $('#tipo_subsidio_solicitado').val());
    });
  }

  cargar_evento_boton_agregar_integrante();

  /*****************************************************************/
    function cargar_evento_boton_agregar_insitucion_de_apoyo()
    {    
      $('#agregar_institucion_de_apoyo').click(function(){
        agregar_institucion_de_apoyo($('#institucion').val(), $('#estado_de_apoyo').val());
      });
    }

    $('#solicito_apoyo_true').change(function() {
        var urlToSubmit = ""       
        var partial_name = "datos_instituciones_que_dieron_apoyo";

        urlToSubmit = "/funcionamiento_salas_v2/"+$('#funcionamiento_sala_v2_id').val()+"/pegar_form_datos_instituciones_que_dieron_apoyo"                
        $.ajax({  
        url: urlToSubmit,
        type: "POST",
        data: { partial_name: partial_name },
        success:function(result) 
            {  
              $("#div_datos_instituciones_que_dieron_apoyo").html(result);
              cargar_evento_boton_agregar_insitucion_de_apoyo();
            }
        });                                          
    });
                                
    $('#solicito_apoyo_false').change(function() {
        $("#div_datos_instituciones_que_dieron_apoyo").html("");
        cargar_evento_boton_agregar_insitucion_de_apoyo();
    });               

     cargar_evento_boton_agregar_insitucion_de_apoyo();

    function agregar_institucion_de_apoyo(institucion, estado_de_apoyo)
    {   
      urlToSubmit = "/funcionamiento_salas_v2/"+$('#funcionamiento_sala_v2_id').val()+"/agregar_institucion_de_apoyo"  
      $.ajax({
        type: "post",
        dataType: "json",
        url: urlToSubmit,      
        data: { institucion: institucion, estado_de_apoyo: estado_de_apoyo },        
        success: function(data){
              //BlanquearCampos();
              $('#div_datos_instituciones_que_dieron_apoyo').html(data);
                //cargar_evento_boton_agregar_insitucion_de_apoyo();
        },
        error: function (request, status, error) 
            {             
              alert("Hay campos inválidos ingresados. Ha ocurrido un error");
            }
      });       
    }
              
};

$(document).ready(ready);
$(document).on('page:load', ready);         



