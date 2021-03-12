<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Happy Pets</title>
  <link rel= "stylesheet" href="http://localhost:8080/HelloWorld1/css/estilos.css">
</head>
<header>
  
    <img class="logo" src="http://localhost:8080/HelloWorld1/img/LogoHappyPets.png" width="80" height="100">
      <div class="ContenedorHeader">
     
      <nav class="nav1">
          <div class="secciones">
          <button class= "boton"><a href=index.html>Página principal</a></button>
      </div>
          <div class="secciones">
          <button class= "boton"><a href=#>Buscar cuidadores</a></button>

          </div>
      <div class="secciones">
          <button class= "boton"><a href=RegistroCuidador.html>Conviértete en cuidador</a></button>
        
      </div>
    
      </nav>

      <div class="nav2">
        <div class="secciones2">
        <button class= "boton"><a href=acceso.html>Acceder</a></button>
    </div>
    <div class="secciones2">
        <button class= "boton"><a href=registro_cliente.html>Registrarse</a></button>
    </div>
      </div>

    </div>
    </header>
<body>
 <h2>Hazte cuidador</h2>
<form action= "http://localhost:8080/HelloWorld1/registroCuidador" method="post">
  <p>
            Nombre:<br>
        <input type="text" name="nombre" >
    </p>
    <p>
        Apellidos:<br>
        <input type="text" name="apellidos">
    </p>

    <p>
        Contraseña:<br>
        <input type="password" name="password" >
    </p>
    <p>
        Repetir contraseña:<br>
        <input type="password" name="repPassword" >
    </p>
    <p>
        Correo electrónico:<br>
    <input type="email" name="email" >
</p>
<p>
    Repetir correo electrónico:<br>
<input type="email" name="repEmail" >
</p>
<p>
    Teléfono:<br>
    <input type="text" name="telefono">
</p>
<p>
    Piso:<br>
    <input type="text" name="piso" >
</p>
<p>
    Número de vivienda/portal:<br>
    <input type="text" name="nVivienda" >
</p>
<p>
    Calle:<br>
    <input type="text" name="calle" >
</p>
<p>
    Población:<br>
    <input type="text" name="poblacion" >
</p>
<p>
Provincia<br>
<select name="provincia">
    <option value="0">- selecciona tu provincia-</option>
    <option value="1">A Coruña</option>
    <option value="2">Pontevedra</option>
    <option value="3">Lugo</option>
    <option value="4">Ourense</option>

</select>
</p>
<p>
Idiomas<br>
<input type="checkbox" name="idiomas">Español<br>
<input type="checkbox" name="idiomas">English<br>
</p>
<p>
    Experiencia<br>
    <select name="experiencia">
        <option value="0">Menos de 1 año</option>
        <option value="1">1 año</option>
        <option value="2">2 años</option>
        <option value="3">Más de 2 años</option>
    
    </select>
    </p>

  
    <p>
      
        ¿Qué animales te interesa cuidar?<br>
      
        <input type="checkbox" name="e-1">Perros<br>
        <input type="checkbox" name="e-2">Gatos<br>
        <input type="checkbox" name="e-3">Roedores<br>
        <input type="checkbox" name="e-4">Aves<br>
        <input type="checkbox" name="e-5">Peces<br>
        <input type="checkbox" name="e-6">Reptiles<br>
       
        </p>
        <p>
           
            ¿Qué servicios te interesa ofrecer?<br>
         
            <input type="checkbox" name="s-1">Paseos<br>
            <input type="checkbox" name="s-2">Visitas a domicilio<br>
            <input type="checkbox" name="s-3">Cuidados a domicilio<br>
            <input type="checkbox" name="s-4">Guardería de día<br>
            <input type="checkbox" name="s-5">Alojamiento<br>
            <input type="checkbox" name="s-6">Me interesan todos los servicios<br>
      
            </p>
       

    <input type="reset" value="Borrar datos">
    <input type="submit" value="Listo">
 
</form>
</body>
</html>