 $(document).ready(function(){   

    //  $("#agregar_usuario").click(function() {  

    //   ////////////////////////////////
    //   $.ajax({
    //         url: "/funcionamiento_salas/obtener_usuario_by_email",
    //         dataType: "json",          
    //         type: "post",
    //         data: { email: $("#email_ingresado").val() },                
    //         success:function(data){                    
                                         
    //           },

    //   });
    //   ////////////////////////////////
    // });
    
    $("#traer_usuario").click(function() {

      //comparar hidden con el mail ingresado
      //usuarios = [dtanel@gmail.com, ginvernizzi@gmail.com]
      if(El_usuario_existe())        
      {        
         alert("El usuario ya fue agregado");  
         $(this).attr("href", "/funcionamiento_salas/obtener_usuario_by_email?email=" + encodeURIComponent($("#email_ingresado").val()) + "&usuario_existe=" + true);
      }                          
      else 
      {  
        $(this).attr("href", "/funcionamiento_salas/obtener_usuario_by_email?email=" + encodeURIComponent($("#email_ingresado").val()) + "&usuario_existe=" + false);                
      }                
      $('#email_ingresado').val("");
    });



    function El_usuario_existe()
    {
      var resp = false
      $('div.usuarios_agregados>div').each(function(){           
        var hijos = $(this).context.children;
        for(var i = 0; i < hijos.length; i++) {        
          if (hijos[i].nodeName == "LABEL" && hijos[i].textContent == $("#email_ingresado").val())
          { 
            resp = true; 
            break;
          }                                
        }
      });
      return resp;
    }

    function agregar_registro_usuario_a_la_tabla(user_id, apellido, nombre)
    {
      var array_users = obtener_tabla_de_usuarios() 
      var user_encontrado = array_users.filter(function( obj ) { return obj.Email == $("#email").val(); })
      if (user_encontrado.length > 0)
      { 
        alert("El usuario ya fue agregado")    
        return ;
      }

      var user_id = user_id;
      var apellido = apellido;    
      var nom = nombre;        
      var email = $("#email").val();        

      $('#users_table').append('<tr id='+user_id+'> </td> <td style="display:none;">'+user_id+'</td> <td>'+apellido+'</td> <td>'+nom+'</td> <td>'+email+'</td> <td> <a href="javascript:void(0);" class="remCF">Eliminar</a> </td> </tr>'); 

      $('#users_fields').append(' <%= user.label :name %><br> <%= user.hidden_field :id %>'); 
    }


    $("#eliminar_todos_los_usuarios").click(function() {  
      //$('#bienes_table').empty();       
      $("#users_table tbody tr").remove(); 
    });

    function obtener_tabla_de_usuarios()
    {
      var columns = $('#users_table thead th').map(function() {
        return $(this).text();
      });

      var users = $('#users_table tbody tr').map(function(i) {
      var row = {};  
      $(this).find('td').each(function(i) {    
        var rowName = columns[i];  
        row[rowName] = $(this).text();
      });  
      return row;
      }).get(); 

      return users;
    }

    $("#users_table").on('click','.remCF',function(){
          $(this).parent().parent().remove();
    });

    $('#crear_funcionamiento_sala').submit(function() {  
      
      var columns = $('#bienes_table thead th').map(function() {
        return $(this).text();
      });

      var usuarios = obtener_tabla_de_usuarios();
      
      if(usuarios.length > 0)
      {
        urlToSubmit = "/funcionamiento_salas";
        $.ajax({  
          url: urlToSubmit,
          dataType: "json",
          //contentType: "application/json",
          type: "POST",
          data: { "funcionamiento_sala": JSON.stringify({ nombre_sala: $("#funcionamiento_sala_nombre_sala").val() ,
                                      domicilio_sala: $("#funcionamiento_sala_domicilio_sala").val(),
                                      localidad_sala: $("#funcionamiento_sala_localidad_sala").val(),
                                      codigo_postal_sala: $("#funcionamiento_sala_codigo_postal_sala").val(),    
                                      provincia_sala: $("#funcionamiento_sala_provincia_sala").val(),                                
                                      descripcion_proyecto: $("#funcionamiento_sala_descripcion_proyecto").val(),
                                      descripcion_estrategias: $("#funcionamiento_sala_descripcion_estrategias").val(),
                                      detalle_plan_gastos: $("#funcionamiento_sala_detalle_plan_gastos").val(),
                                      apellido: $("#funcionamiento_sala_apellido").val(),
                                      num_cuit: $("#funcionamiento_sala_num_cuit").val(),
                                      domicilio: $("#funcionamiento_sala_domicilio").val(),
                                      localidad: $("#funcionamiento_sala_localidad").val(),
                                      codigo_postal: $("#funcionamiento_sala_codigo_postal").val(),
                                      provincia: $("#funcionamiento_sala_provincia").val(),
                                      email: $("#funcionamiento_sala_email").val(),
                                      telefono: $("#funcionamiento_sala_telefono").val(),
                                      monto_letra: $("#funcionamiento_sala_monto_letra").val(),
                                      monto_numero: $("#funcionamiento_sala_monto_numero").val(),
                                      localidad_sala: $("#funcionamiento_sala_localidad_sala").val(),
                                      }), "usuarios": JSON.stringify({ usuarios })  },
          success:function(result) {       
                alert("La configuracion de la sala fue realizada exitosamente");
                //ImprimirFormulario(result.id);              
                window.location.replace("/funcionamiento_salas");   
              },

          error: function (request, status, error) {                 

                  var nada =  jQuery(request.responseText).find('#crear_funcionamiento_sala').html()
                  $('#crear_funcionamiento_sala').html(nada);

                  alert("Revise los campos. La configuracion de sala no fue realizada");                
                }                
        });                
      }
      else
      { alert("Debe agregar al menos un usuario.")}  
      return false; // prevents normal behaviour  
    });            

      $("div").on("click", "button", function(e) {
          e.preventDefault();
          $(this).parent().remove();
      });

});    

