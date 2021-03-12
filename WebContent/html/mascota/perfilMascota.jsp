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
          <button class= "boton"><a href=http://localhost:8080/HelloWorld1/html/index.jsp>Página principal</a></button>
      </div>
          <div class="secciones">
          <button class= "boton"><a href=http://localhost:8080/HelloWorld1/html/cuidador/search.jsp>Buscar cuidadores</a></button>

          </div>
      <div class="secciones">
          <button class= "boton"><a href=RegistroCuidador.html>Conviértete en cuidador</a></button>
        
      </div>
    
      </nav>

      <div class="nav2">
        <div class="secciones2">
        <button class= "boton"><a href=http://localhost:8080/HelloWorld1/html/usuario/login.jsp>Acceder</a></button>
    </div>
    <div class="secciones2">
        <button class= "boton"><a href=registro_cliente.html>Registrarse</a></button>
    </div>
      </div>

    </div>
    </header>
    <h2>Semi</h2>
     <form action= "http://localhost:8080/HelloWorld1/perfilMascota" method="post">
              <input type=hidden name="action" value="mascota"/>
        <div class="mascotas">
        <div class="fotoMascota">
        
       <img src="semi1.jpg" width="350" height="350">
    </div>
    
    <div class="mascotasInfo">
        <form>
        <p>
            Fecha de nacimiento (aproximada):<br>
            <input type="date" name="mascota">
        </p>
    
        <p>
            Especie:<br>
            <select name="menu">
                <option value="0">- selecciona la especie-</option>
                <option value="1">Perro</option>
                <option value="2">Gato</option>
                <option value="3">Ave</option>
                <option value="5">Roedor</option>
                <option value="6">Reptil</option>
                <option value="7">Pez</option>
            
            </select>
        </p>
        <p>
            Tiene microchip?<br>
            <select name="menu">
                <option value="0">Sí</option>
                <option value="1">No</option>
            
            </select>
        </p>
        <p>
            Está vacunado?<br>
            <select name="menu">
                <option value="0">Sí</option>
                <option value="1">No</option>
            
            </select>
    </p>
    <p>
        Está esterilizado?<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Padece alguna alergia? (señala cuál en la sección de descripción)<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Está bajo tratamiento? (señala cuál en la sección de descripción)<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Se lleva bien con otros animales?<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Se lleva bien con los niños?<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Descripción:<br>
        <textarea id="descripcion"></textarea>
    </p>
     </div>
</div>
    <input type="submit" value="Guardar">
</form>
   
</body>
</html>