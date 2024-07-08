import time
import tkinter as tk
from tkinter import messagebox

# Función para mostrar el recordatorio
def recordatorio_agua():
    messagebox.showinfo("Recordatorio", "¡Recuerda tomar agua!")

# Función principal que ejecuta el recordatorio cada 10 minutos
def ejecutar_recordatorio():
    while True:
        # Mostrar recordatorio
        recordatorio_agua()

        # Esperar 10 minutos (600 segundos)
        time.sleep(600)

        # Preguntar si se desea detener el recordatorio
        respuesta = messagebox.askquestion("Detener recordatorio", "¿Deseas detener el recordatorio de agua?")
        
        # Si se elige "Sí", salir del bucle y terminar el script
        if respuesta == 'yes':
            break

# Interfaz gráfica para iniciar el recordatorio
root = tk.Tk()
root.title("Recordatorio de Agua")

# Botón para iniciar el recordatorio
btn_iniciar = tk.Button(root, text="Iniciar recordatorio", command=ejecutar_recordatorio)
btn_iniciar.pack(pady=20)

root.mainloop()
