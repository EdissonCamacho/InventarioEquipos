import { Injectable,inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ServiceEquiposSedeService {

  constructor() { }
  
  private http=inject(HttpClient)
  public url:string="http://localhost:8000/sede/"

  public getEquiposSede(idSede:string):any{
    return this.http.get(this.url+idSede+"/equipos"
    );
  }

}
