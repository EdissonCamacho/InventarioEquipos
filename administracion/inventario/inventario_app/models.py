from django.db import models

class Sede(models.Model):
    idSede = models.AutoField(primary_key=True)
    nombreSede = models.CharField(max_length=50)

    class Meta:
        db_table = "sede"
        managed = False

    def __str__(self):
        return self.nombreSede

class Responsable(models.Model):
    idResponsable = models.AutoField(primary_key=True)
    nombreCompleto = models.CharField(max_length=255)
    correo = models.EmailField(max_length=100)
    telefono = models.CharField(max_length=100)

    class Meta:
        db_table = "responsable"
        managed = False

    def __str__(self):
        return self.nombreCompleto

class TipoEquipo(models.Model):
    idTipoEquipo = models.AutoField(primary_key=True)
    tipoEquipo = models.CharField(max_length=100)

    class Meta:
        db_table = "tipoEquipo"
        managed = False

    def __str__(self):
        return self.tipoEquipo

class Equipo(models.Model):
    idEquipo = models.AutoField(primary_key=True)
    nombreEquipo = models.CharField(max_length=100)
    modeloEquipo = models.CharField(max_length=100)
    serialEquipo = models.CharField(max_length=100)
    estadoOperatividad = models.CharField(max_length=100)
    sistemaOperativo = models.CharField(max_length=100)
    caracteristivas = models.CharField(max_length=500)
    urlImagen = models.CharField(max_length=100)
    
    idTipoEquipo = models.ForeignKey(
        TipoEquipo, 
        on_delete=models.CASCADE, 
        related_name="equipos",
        db_column='idTipoEquipo'  # Usa el nombre de columna exacto
    )
    idResponsable = models.ForeignKey(
        Responsable, 
        on_delete=models.CASCADE, 
        related_name="equipos",
        db_column='idResponsable'  # Usa el nombre de columna exacto
    )

    class Meta:
        db_table = "equipo"
        managed = False

    def __str__(self):
        return self.nombreEquipo

class EquipoSede(models.Model):
    idEquipoSede = models.AutoField(primary_key=True)
    idEquipo = models.ForeignKey(
        Equipo, 
        on_delete=models.CASCADE, 
        related_name="equipos_sede",
        db_column='idEquipo'  # Usa el nombre de columna exacto
    )
    idSede = models.ForeignKey(
        Sede, 
        on_delete=models.CASCADE, 
        related_name="equipos",
        db_column='idSede'  # Usa el nombre de columna exacto
    )
    ubicacion = models.CharField(max_length=50)

    class Meta:
        db_table = "equipoSede"
        managed = False

    def __str__(self):
        return f'{self.idEquipo.nombreEquipo} - {self.idSede.nombreSede}'
