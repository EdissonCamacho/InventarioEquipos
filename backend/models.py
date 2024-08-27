from sqlalchemy import String, Integer, Column, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class Sede(Base):
    __tablename__ = "sede"
    
    idSede = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nombreSede = Column(String(50))
    
    # Puedes agregar relaciones si es necesario
    # Relación con equipoSede
    equipos = relationship("EquipoSede", back_populates="sede")

class Responsable(Base):
    __tablename__ = "responsable"
    
    idResponsable = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nombreCompleto = Column(String(255))
    correo = Column(String(100))
    telefono = Column(String(100))
    
    # Puedes agregar relaciones si es necesario
    # Relación con equipo
    equipos = relationship("Equipo", back_populates="responsable")

class TipoEquipo(Base):
    __tablename__ = "tipoEquipo"
    
    idTipoEquipo = Column(Integer, primary_key=True, index=True, autoincrement=True)
    tipoEquipo = Column(String(100))
    
    # Puedes agregar relaciones si es necesario
    # Relación con equipo
    equipos = relationship("Equipo", back_populates="tipo_equipo")

class Equipo(Base):
    __tablename__ = "equipo"
    
    idEquipo = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nombreEquipo = Column(String(100))
    modeloEquipo = Column(String(100))
    serialEquipo = Column(String(100))
    estadoOperatividad = Column(String(100))
    sistemaOperativo = Column(String(100))
    caracteristivas = Column(String(500))
    urlImagen=Column(String(100))
    
    # Llaves foráneas
    idTipoEquipo = Column(Integer, ForeignKey("tipoEquipo.idTipoEquipo"))
    idResponsable = Column(Integer, ForeignKey("responsable.idResponsable"))
    
    # Relaciones
    tipo_equipo = relationship("TipoEquipo", back_populates="equipos")
    responsable = relationship("Responsable", back_populates="equipos")
    equipos_sede = relationship("EquipoSede", back_populates="equipo")

class EquipoSede(Base):
    __tablename__ = "equipoSede"
    
    idEquipoSede = Column(Integer, primary_key=True, index=True, autoincrement=True)
    idEquipo = Column(Integer, ForeignKey("equipo.idEquipo"))
    idSede = Column(Integer, ForeignKey("sede.idSede"))
    ubicacion = Column(String(50))
    
    # Relaciones
    equipo = relationship("Equipo", back_populates="equipos_sede")
    sede = relationship("Sede", back_populates="equipos")




