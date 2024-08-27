import { Component } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterOutlet, RouterLink, RouterLinkActive, ActivatedRoute } from '@angular/router';
import { ServiceEquiposSedeService } from '../service-equipos-sede.service';

@Component({
  selector: 'app-vista-sede',
  standalone: true,
  imports: [ReactiveFormsModule,RouterOutlet,RouterLink,RouterLinkActive,FormsModule],
  templateUrl: './vista-sede.component.html',
  styleUrl: './vista-sede.component.css'
})
export class VistaSedeComponent {

  idSede:any;
  equipo:any;
  ubicacion:any
  ngOnInit(): void {
    this.obtenerSede();
    this.obtenerEquipos();
    

    

   
   
 }
 constructor(private route: ActivatedRoute,private serviceEquipos:ServiceEquiposSedeService){

 }

 obtenerEquipos(){
  this.serviceEquipos.getEquiposSede(this.idSede).subscribe((
    data:any)=>{
    console.log(data);
    this.equipo = data;
  }, (error:any) =>{ 
    console.log('El error es: '+error);
     })

 }

 obtenerSede(){
  this.idSede = this.route.snapshot.paramMap.get('idsede');
  console.log(this.idSede)

 }

 buscarEquipos(){

  this.serviceEquipos.getPorSedeUbicacion(this.idSede,this.ubicacion).subscribe((
    data:any)=>{
    console.log(data);  
    this.equipo = data;
  }, (error:any) =>{ 
    console.log(error);
     })

  

 }
 


}
