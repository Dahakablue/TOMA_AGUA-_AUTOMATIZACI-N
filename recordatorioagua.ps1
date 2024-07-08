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

    $buttonSi = New-Object System.Windows.Forms.Button
    $buttonSi.Location = New-Object System.Drawing.Point(40,80)
    $buttonSi.Size = New-Object System.Drawing.Size(100,30)
    $buttonSi.Text = "Sí"
    $buttonSi.DialogResult = [System.Windows.Forms.DialogResult]::Yes
    $form.Controls.Add($buttonSi)

    $buttonNo = New-Object System.Windows.Forms.Button
    $buttonNo.Location = New-Object System.Drawing.Point(160,80)
    $buttonNo.Size = New-Object System.Drawing.Size(100,30)
    $buttonNo.Text = "No"
    $buttonNo.DialogResult = [System.Windows.Forms.DialogResult]::No
    $form.Controls.Add($buttonNo)

    $form.AcceptButton = $buttonNo
    $form.CancelButton = $buttonSi

    $result = $form.ShowDialog()

    $form.Dispose()

    return $result
}

# Función para ejecutar el recordatorio cada 10 minutos
function EjecutarRecordatorio {
    while ($true) {
        # Mostrar recordatorio
        $resultado = MostrarRecordatorio

        # Si se elige "Sí" (detener el recordatorio), salir del bucle
        if ($resultado -eq [System.Windows.Forms.DialogResult]::Yes) {
            break
        }

        # Esperar 10 minutos (600 segundos)
        Start-Sleep -Seconds 600
    }
}

# Llamar a la función para iniciar el recordatorio
EjecutarRecordatorio
