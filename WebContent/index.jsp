<%@ page language="java" import="java.sql.*" %>
<%
    /*conexion sera nuestra conexion a la bd*/
    Connection conexion=null;
 
    String mensaje="";
 
    /*parametros para la conexion*/
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/biblioteca?serverTimezone=EST5EDT";
    String usuario = "";
    String clave = "root";
    /*procedimiento de la conexion*/
    try{
      //  Class.forName(driver);
        conexion = DriverManager.getConnection(url,usuario,clave);
        mensaje="conectado";
        /*guardando la conexion en la session*/
        session.setAttribute("conexion",conexion);
    } catch (Exception ex){
        mensaje=ex.toString();
    }
 
    
   
%>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
<script type="text/javascript" language="JavaScript">
function carga() {
	document.getElementById("usuario").focus();
}

function validarDatos() {
	var usuario=document.getElementById("usuario");
	var password=document.getElementById("password");
	if (usuario.value == "" || usuario.value == '' || usuario.value==null) {
		aler("Ingresa un usuario");
		usuario.focus();
		return false;
	}else if (password.value == "" || password.value == '' || password.value==null) {
		aler("Ingresa un password");
		password.focus();
		return false;
	}else if ((password.value == "" || password.value == '' || password.value==null) &&
			(password.value == "" || password.value == '' || password.value==null)) {
		
		aler("Ingresa un password");
		usuario.focus();
		return false;
	}else {
		return true;
	}
	
}

</script>
</head>
<body onload="carga();">

<p>HTML</p>

<form action="" method="POST" onsubmit="return validarDatos();">
	<table align="center">
	<tr>
	<td colspan="2" style="font-weight: bold; size: 20px">Ingrese Usuario y Contrase�a	</td>
	</tr>
	<tr>
	<td style="font-weight: bold; size: 12px; color: blue" align="right" >Usuario: </td>
	<td><input type="text" name="usuario" id ="usuario"> </td>
	</tr>
		<tr>
	<td style="font-weight: bold; size: 12px;color: blue" align="right"">Password: </td>
	<td><input type="password" name="password" id ="password"> </td>
	</tr>
		<tr>
	<td><input type="button" value="Cancelar" style="font-size: 14px; color: blue;"> </td>
	<td><input type="submit" value="Aceptar" style="font-size: 14px; color: blue;"> </td>
	</tr>
	
	</table>
</form>



<form action="" method="post">
            <input name="estado" type="text" value="Estado: <%=mensaje%>"/>
            <input type="submit" value="Probar"/>
        </form>




</body>
</html>

