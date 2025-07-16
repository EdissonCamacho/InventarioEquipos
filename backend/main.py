from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy import String, Integer, Column, ForeignKey, Date
from sqlalchemy.orm import Session, relationship, joinedload, sessionmaker # <--- ADD sessionmaker HERE
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from typing import List, Optional
from datetime import date 
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

# --- Configuración de la Base de Datos ---
# Ajusta esta URL a tu base de datos (por ejemplo, PostgreSQL, MySQL)
# Para SQLite, puedes usar: "sqlite:///./sql_app.db"
# If you are using MySQL, make sure to change this back to your MySQL URL:
SQLALCHEMY_DATABASE_URL = "mysql+pymysql://root:Neytel2024@127.0.0.1:3306/inventario" 
# Or if you want to test with SQLite for now:
# SQLALCHEMY_DATABASE_URL = "sqlite:///./sql_app.db" 

engine = create_engine(
    SQLALCHEMY_DATABASE_URL, 
    # The connect_args for SQLite are not strictly needed for MySQL,
    # but keeping it doesn't hurt if you switch databases often.
    connect_args={"check_same_thread": False} if "sqlite" in SQLALCHEMY_DATABASE_URL else {} 
    ,pool_timeout=60 # Added from your previous message for MySQL
)

# --- FIX IS HERE ---
# Use sessionmaker to create a callable session factory
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
# --- END FIX ---

Base = declarative_base()

# --- Modelos de SQLAlchemy ---
class Sede(Base):
    __tablename__ = "sede"
    
    idSede = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nombreSede = Column(String(50))
    
    equipos = relationship("EquipoSede", back_populates="sede")

class Responsable(Base):
    __tablename__ = "responsable"
    
    idResponsable = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nombreCompleto = Column(String(255))
    correo = Column(String(100))
    telefono = Column(String(100))
    
    equipos = relationship("Equipo", back_populates="responsable")

class TipoEquipo(Base):
    __tablename__ = "tipoEquipo"
    
    idTipoEquipo = Column(Integer, primary_key=True, index=True, autoincrement=True)
    tipoEquipo = Column(String(100))
    
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
    
    idTipoEquipo = Column(Integer, ForeignKey("tipoEquipo.idTipoEquipo"))
    idResponsable = Column(Integer, ForeignKey("responsable.idResponsable"))
    
    tipo_equipo = relationship("TipoEquipo", back_populates="equipos")
    responsable = relationship("Responsable", back_populates="equipos")
    equipos_sede = relationship("EquipoSede", back_populates="equipo")
    actividades_realizadas = relationship("ActividadRealizada", back_populates="equipo_rel") 

class EquipoSede(Base):
    __tablename__ = "equipoSede"
    
    idEquipoSede = Column(Integer, primary_key=True, index=True, autoincrement=True)
    idEquipo = Column(Integer, ForeignKey("equipo.idEquipo"))
    idSede = Column(Integer, ForeignKey("sede.idSede"))
    ubicacion = Column(String(50))
    
    equipo = relationship("Equipo", back_populates="equipos_sede")
    sede = relationship("Sede", back_populates="equipos")

class ActividadRealizada(Base):
    __tablename__ = "actividadRealizada"
    
    idActividadRealizada = Column(Integer, primary_key=True, index=True, autoincrement=True)
    idEquipo = Column(Integer, ForeignKey("equipo.idEquipo"))
    fecha = Column(Date)
    observacion = Column(String(255))
    tipoMantenimiento = Column(String(255))
    tecnico = Column(String(255))
    
    equipo_rel = relationship("Equipo", back_populates="actividades_realizadas")

# --- Configuración de FastAPI ---
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Inicializar la base de datos (crea las tablas si no existen)
Base.metadata.create_all(bind=engine)

# Dependencia para obtener la sesión de la base de datos
def get_db():
    db = SessionLocal() # This line will now correctly call the sessionmaker factory
    try:
        yield db
    finally:
        db.close()

# --- Modelos Pydantic para Salida de Datos ---
class TipoEquipoOut(BaseModel):
    idTipoEquipo: int
    tipoEquipo: str

    class Config:
        orm_mode = True

class ResponsableOut(BaseModel):
    idResponsable: int
    nombreCompleto: str
    correo: str
    telefono: str

    class Config:
        orm_mode = True

class EquipoOut(BaseModel):
    idEquipo: int
    nombreEquipo: str
    modeloEquipo: str
    serialEquipo: str
    estadoOperatividad: str
    sistemaOperativo: str
    caracteristivas: str
    tipo_equipo: TipoEquipoOut
    responsable: ResponsableOut
    urlImagen:str

    class Config:
        orm_mode = True

class SedeOut(BaseModel):
    idSede: int
    nombreSede: str

    class Config:
        orm_mode = True

class EquipoSedeOut(BaseModel):
    idEquipoSede: int
    equipo: EquipoOut
    sede: SedeOut
    ubicacion: str

    class Config:
        orm_mode = True

class ActividadRealizadaOut(BaseModel):
    idActividadRealizada: int
    fecha: date
    observacion: str
    tipoMantenimiento: str
    tecnico: str
    equipo_rel: EquipoOut 

    class Config:
        orm_mode = True

# --- Endpoints de la API ---

## Endpoints para la tabla 'sede'
@app.get("/sede/{sede_id}", response_model=SedeOut)
def read_sede(sede_id: int, db: Session = Depends(get_db)):
    db_sede = db.query(Sede).filter(Sede.idSede == sede_id).first()
    if db_sede is None:
        raise HTTPException(status_code=404, detail="Sede not found")
    return db_sede

@app.get("/sede/", response_model=List[SedeOut])
def read_sedes(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(Sede).offset(skip).limit(limit).all()

## Endpoints para la tabla 'responsable'
@app.get("/responsable/{responsable_id}", response_model=ResponsableOut)
def read_responsable(responsable_id: int, db: Session = Depends(get_db)):
    db_responsable = db.query(Responsable).filter(Responsable.idResponsable == responsable_id).first()
    if db_responsable is None:
        raise HTTPException(status_code=404, detail="Responsable not found")
    return db_responsable

@app.get("/responsable/", response_model=List[ResponsableOut])
def read_responsables(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(Responsable).offset(skip).limit(limit).all()

## Endpoints para la tabla 'tipoEquipo'
@app.get("/tipoEquipo/{tipo_equipo_id}", response_model=TipoEquipoOut)
def read_tipo_equipo(tipo_equipo_id: int, db: Session = Depends(get_db)):
    db_tipo_equipo = db.query(TipoEquipo).filter(TipoEquipo.idTipoEquipo == tipo_equipo_id).first()
    if db_tipo_equipo is None:
        raise HTTPException(status_code=404, detail="TipoEquipo not found")
    return db_tipo_equipo

@app.get("/tipoEquipo/", response_model=List[TipoEquipoOut])
def read_tipo_equipos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(TipoEquipo).offset(skip).limit(limit).all()

## Endpoints para la tabla 'equipo'
@app.get("/equipo/{equipo_id}", response_model=EquipoOut)
def read_equipo(equipo_id: int, db: Session = Depends(get_db)):
    db_equipo = db.query(Equipo).options(joinedload(Equipo.tipo_equipo), joinedload(Equipo.responsable)).filter(Equipo.idEquipo == equipo_id).first()
    if db_equipo is None:
        raise HTTPException(status_code=404, detail="Equipo not found")
    return db_equipo

@app.get("/equipo/", response_model=List[EquipoOut])
def read_equipos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(Equipo).options(joinedload(Equipo.tipo_equipo), joinedload(Equipo.responsable)).offset(skip).limit(limit).all()

## Endpoints para la tabla 'equipoSede'
@app.get("/equipoSede/{equipo_sede_id}", response_model=EquipoSedeOut)
def read_equipo_sede(equipo_sede_id: int, db: Session = Depends(get_db)):
    db_equipo_sede = db.query(EquipoSede).options(
        joinedload(EquipoSede.equipo).joinedload(Equipo.tipo_equipo), 
        joinedload(EquipoSede.equipo).joinedload(Equipo.responsable), 
        joinedload(EquipoSede.sede)
    ).filter(EquipoSede.idEquipoSede == equipo_sede_id).first()
    if db_equipo_sede is None:
        raise HTTPException(status_code=404, detail="EquipoSede not found")
    return db_equipo_sede

@app.get("/equipoSede/", response_model=List[EquipoSedeOut])
def read_equipo_sedes(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(EquipoSede).options(
        joinedload(EquipoSede.equipo).joinedload(Equipo.tipo_equipo), 
        joinedload(EquipoSede.equipo).joinedload(Equipo.responsable), 
        joinedload(EquipoSede.sede)
    ).offset(skip).limit(limit).all()

## Endpoints combinados
@app.get("/sede/{sede_id}/equipos", response_model=List[EquipoOut])
def read_equipos_by_sede(sede_id: int, db: Session = Depends(get_db)):
    db_equipos = db.query(Equipo).join(EquipoSede).filter(EquipoSede.idSede == sede_id).options(
        joinedload(Equipo.tipo_equipo),
        joinedload(Equipo.responsable)
    ).all()
    
    if not db_equipos:
        raise HTTPException(status_code=404, detail="No se encontraron equipos para esta sede")
    
    return db_equipos

@app.get("/equipoSede/{sede_id}/ubicacion/{ubicacion}", response_model=List[EquipoOut])
def read_equipos_by_sede_and_ubicacion(sede_id: int, ubicacion: str, db: Session = Depends(get_db)):
    db_equipos = db.query(Equipo).join(EquipoSede).filter(
        EquipoSede.idSede == sede_id,
        EquipoSede.ubicacion == ubicacion
    ).options(
        joinedload(Equipo.tipo_equipo),
        joinedload(Equipo.responsable)
    ).all()
    
    if not db_equipos:
        raise HTTPException(status_code=404, detail="No se encontraron equipos en la ubicación especificada para esta sede")
    
    return db_equipos

## Endpoints para la tabla 'actividadRealizada'
@app.get("/actividadRealizada/{actividad_id}", response_model=ActividadRealizadaOut)
def read_actividad_realizada(actividad_id: int, db: Session = Depends(get_db)):
    db_actividad = db.query(ActividadRealizada).options(
        joinedload(ActividadRealizada.equipo_rel).joinedload(Equipo.tipo_equipo),
        joinedload(ActividadRealizada.equipo_rel).joinedload(Equipo.responsable)
    ).filter(ActividadRealizada.idActividadRealizada == actividad_id).first()
    
    if db_actividad is None:
        raise HTTPException(status_code=404, detail="ActividadRealizada not found")
    return db_actividad

@app.get("/actividadRealizada/", response_model=List[ActividadRealizadaOut])
def read_actividades_realizadas(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(ActividadRealizada).options(
        joinedload(ActividadRealizada.equipo_rel).joinedload(Equipo.tipo_equipo),
        joinedload(ActividadRealizada.equipo_rel).joinedload(Equipo.responsable)
    ).offset(skip).limit(limit).all()

@app.get("/equipo/{equipo_id}/actividades", response_model=List[ActividadRealizadaOut])
def read_actividades_by_equipo(equipo_id: int, db: Session = Depends(get_db)):
    db_actividades = db.query(ActividadRealizada).options(
        joinedload(ActividadRealizada.equipo_rel).joinedload(Equipo.tipo_equipo),
        joinedload(ActividadRealizada.equipo_rel).joinedload(Equipo.responsable)
    ).filter(ActividadRealizada.idEquipo == equipo_id).all()
    
    if not db_actividades:
        raise HTTPException(status_code=404, detail="No se encontraron actividades para este equipo")
    
    return db_actividades