import { HttpClient } from '@angular/common/http';
import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ServiceSedesService {

  constructor() { }

  private http=inject(HttpClient)
  public url:string="http://localhost:8000/sede/"

  public getSedes():any{
    return this.http.get(this.url);
  }

}
