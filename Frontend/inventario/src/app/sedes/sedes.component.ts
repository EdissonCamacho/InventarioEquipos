import { Component } from '@angular/core';
import { ServiceSedesService } from '../service-sedes';
import { RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';


@Component({
  selector: 'app-sedes',
  standalone: true,
  imports: [ReactiveFormsModule,RouterOutlet,RouterLink,RouterLinkActive],
  templateUrl: './sedes.component.html',
  styleUrl: './sedes.component.css'
})
export class SedesComponent {
  constructor(private serviceSedes:ServiceSedesService){}

  sedes:any;
  ngOnInit(): void {
    this.cargarSedes();
    

   
   
 }

 cargarSedes(){

  this.serviceSedes.getSedes().subscribe((
    data:any)=>{
    console.log(data);
    this.sedes = data;
  }, (error:any) =>{ 
    console.log('El error es: '+error);
     }
  
) 



 }


}
