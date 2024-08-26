from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload
from typing import List, Optional

from database import SessionLocal, engine, Base
from models import Sede, Responsable, TipoEquipo, Equipo, EquipoSede
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Puedes restringir esto a dominios específicos
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)



# Inicializar la base de datos (opcional si ya lo has hecho)
Base.metadata.create_all(bind=engine)

# Dependencia para obtener la sesión de la base de datos
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Modelos Pydantic para salida de datos
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

# Endpoints para la tabla 'sede'
@app.get("/sede/{sede_id}", response_model=SedeOut)
def read_sede(sede_id: int, db: Session = Depends(get_db)):
    db_sede = db.query(Sede).filter(Sede.idSede == sede_id).first()
    if db_sede is None:
        raise HTTPException(status_code=404, detail="Sede not found")
    return db_sede

@app.get("/sede/", response_model=List[SedeOut])
def read_sedes(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(Sede).offset(skip).limit(limit).all()

# Endpoints para la tabla 'responsable'
@app.get("/responsable/{responsable_id}", response_model=ResponsableOut)
def read_responsable(responsable_id: int, db: Session = Depends(get_db)):
    db_responsable = db.query(Responsable).filter(Responsable.idResponsable == responsable_id).first()
    if db_responsable is None:
        raise HTTPException(status_code=404, detail="Responsable not found")
    return db_responsable

@app.get("/responsable/", response_model=List[ResponsableOut])
def read_responsables(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(Responsable).offset(skip).limit(limit).all()

# Endpoints para la tabla 'tipoEquipo'
@app.get("/tipoEquipo/{tipo_equipo_id}", response_model=TipoEquipoOut)
def read_tipo_equipo(tipo_equipo_id: int, db: Session = Depends(get_db)):
    db_tipo_equipo = db.query(TipoEquipo).filter(TipoEquipo.idTipoEquipo == tipo_equipo_id).first()
    if db_tipo_equipo is None:
        raise HTTPException(status_code=404, detail="TipoEquipo not found")
    return db_tipo_equipo

@app.get("/tipoEquipo/", response_model=List[TipoEquipoOut])
def read_tipo_equipos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(TipoEquipo).offset(skip).limit(limit).all()

# Endpoints para la tabla 'equipo'
@app.get("/equipo/{equipo_id}", response_model=EquipoOut)
def read_equipo(equipo_id: int, db: Session = Depends(get_db)):
    db_equipo = db.query(Equipo).options(joinedload(Equipo.tipo_equipo), joinedload(Equipo.responsable)).filter(Equipo.idEquipo == equipo_id).first()
    if db_equipo is None:
        raise HTTPException(status_code=404, detail="Equipo not found")
    return db_equipo

@app.get("/equipo/", response_model=List[EquipoOut])
def read_equipos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(Equipo).options(joinedload(Equipo.tipo_equipo), joinedload(Equipo.responsable)).offset(skip).limit(limit).all()

# Endpoints para la tabla 'equipoSede'
@app.get("/equipoSede/{equipo_sede_id}", response_model=EquipoSedeOut)
def read_equipo_sede(equipo_sede_id: int, db: Session = Depends(get_db)):
    db_equipo_sede = db.query(EquipoSede).options(joinedload(EquipoSede.equipo).joinedload(Equipo.tipo_equipo), joinedload(EquipoSede.equipo).joinedload(Equipo.responsable), joinedload(EquipoSede.sede)).filter(EquipoSede.idEquipoSede == equipo_sede_id).first()
    if db_equipo_sede is None:
        raise HTTPException(status_code=404, detail="EquipoSede not found")
    return db_equipo_sede

@app.get("/equipoSede/", response_model=List[EquipoSedeOut])
def read_equipo_sedes(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    return db.query(EquipoSede).options(joinedload(EquipoSede.equipo).joinedload(Equipo.tipo_equipo), joinedload(EquipoSede.equipo).joinedload(Equipo.responsable), joinedload(EquipoSede.sede)).offset(skip).limit(limit).all()


@app.get("/sede/{sede_id}/equipos", response_model=List[EquipoOut])
def read_equipos_by_sede(sede_id: int, db: Session = Depends(get_db)):
    db_equipos = db.query(Equipo).join(EquipoSede).filter(EquipoSede.idSede == sede_id).options(
        joinedload(Equipo.tipo_equipo),
        joinedload(Equipo.responsable)
    ).all()
    
    if not db_equipos:
        raise HTTPException(status_code=404, detail="No se encontraron equipos para esta sede")
    
    return db_equipos