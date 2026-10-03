// Función para filtrar las habilidades técnicas por categoría
function filtrarHabilidades(categoria) {
  // 1. Quitar la clase 'activo' de todos los botones y ponérsela al botón pulsado
  const botones = document.querySelectorAll('.btn-filtro');
  botones.forEach(btn => btn.classList.remove('activo'));
  
  if (event && event.target) {
    event.target.classList.add('activo');
  }

  // 2. Mostrar u ocultar los chips según la categoría seleccionada
  const chips = document.querySelectorAll('.chip');
  chips.forEach(chip => {
    if (categoria === 'todos' || chip.classList.contains(categoria)) {
      chip.style.display = 'inline-block';
    } else {
      chip.style.display = 'none';
    }
  });
}

// Función para validar y simular el envío del formulario de contacto
function enviarMensaje(e) {
  e.preventDefault();

  const nombre = document.getElementById('nombre').value.trim();
  const correo = document.getElementById('correo').value.trim();
  const mensaje = document.getElementById('mensaje').value.trim();
  const mensajeExito = document.getElementById('mensajeExito');

  // Si los campos tienen texto, mostramos la confirmación
  if (nombre !== '' && correo !== '' && mensaje !== '') {
    mensajeExito.classList.remove('oculto');
    document.getElementById('formularioContacto').reset();

    // Ocultar el mensaje después de 4 segundos
    setTimeout(() => {
      mensajeExito.classList.add('oculto');
    }, 4000);
  }
}
