import { Injectable,inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ServiceActividad {

  constructor() { }
  
  private http=inject(HttpClient)
  public url:string="http://localhost:8000/equipo/"
  

  public getEquiposSede(idEquipo:string):any{
    
    
    return this.http.get(this.url+idEquipo+"/actividades"
    );
  }

  public getEquipo(idEquipo:string):any{
    
    
    return this.http.get(this.url+idEquipo
    );
  }


  

}
