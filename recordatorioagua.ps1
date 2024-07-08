# Función para mostrar el recordatorio
function MostrarRecordatorio {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Recordatorio de agua"
    $form.Size = New-Object System.Drawing.Size(300,150)
    $form.StartPosition = "CenterScreen"

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(70,20)
    $label.Size = New-Object System.Drawing.Size(200,20)
    $label.Text = "¡Recuerda tomar agua!"
    $form.Controls.Add($label)

    $buttonGracias = New-Object System.Windows.Forms.Button
    $buttonGracias.Location = New-Object System.Drawing.Point(40,80)
    $buttonGracias.Size = New-Object System.Drawing.Size(100,30)
    $buttonGracias.Text = "Gracias por recordarme"
    $buttonGracias.DialogResult = [System.Windows.Forms.DialogResult]::Yes
    $form.Controls.Add($buttonGracias)

    $buttonApagate = New-Object System.Windows.Forms.Button
    $buttonApagate.Location = New-Object System.Drawing.Point(160,80)
    $buttonApagate.Size = New-Object System.Drawing.Size(100,30)
    $buttonApagate.Text = "Apagate"
    $buttonApagate.DialogResult = [System.Windows.Forms.DialogResult]::No
    $form.Controls.Add($buttonApagate)

    $form.AcceptButton = $buttonApagate
    $form.CancelButton = $buttonGracias

    $result = $form.ShowDialog()

    $form.Dispose()

    return $result
}

# Función para ejecutar el recordatorio cada 10 minutos
function EjecutarRecordatorio {
    while ($true) {
        # Mostrar recordatorio
        $resultado = MostrarRecordatorio

        # Si se elige "Gracias por recordarme" (detener el recordatorio), salir del bucle
        if ($resultado -eq [System.Windows.Forms.DialogResult]::Yes) {
            break
        }

        # Esperar 10 minutos (600 segundos)
        Start-Sleep -Seconds 600
    }
}

# Llamar a la función para iniciar el recordatorio
EjecutarRecordatorio
