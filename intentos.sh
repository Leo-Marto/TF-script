# Número máximo de intentos
MAX_INTENTOS=20

# Contador de intentos
intento=1

echo "Probando conexión con el inventario en el inventario..."

# Bucle para probar la conexión
while [ $intento -le $MAX_INTENTOS ]; do
  echo "Intento $intento de $MAX_INTENTOS..."

  # Ejecuta el comando de prueba de conexión
  ansible all -m ping -i "$INVENTARIO" > /dev/null 2>&1

  # Comprueba si la conexión fue exitosa
  if [ $? -eq 0 ]; then
    echo "Conexión exitosa en el intento $intento."
    ansible-playbook microk8s.yaml -vvv
    exit 0
  else
    echo "Fallo de conexión en el intento $intento."
  fi

  # Incrementa el contador de intentos
  intento=$((intento + 1))
  echo "Esperando un minuto para realizar un nuevo intento"
  # Espera 1 minuto antes del siguiente intento
  sleep 60
done

