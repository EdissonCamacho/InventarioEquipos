from django.contrib import admin

from django.contrib import admin
from .models import Sede, Responsable, TipoEquipo, Equipo, EquipoSede

admin.site.register(Sede)
admin.site.register(Responsable)
admin.site.register(TipoEquipo)
admin.site.register(Equipo)
admin.site.register(EquipoSede)