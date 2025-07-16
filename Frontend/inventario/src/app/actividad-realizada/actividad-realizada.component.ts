import { Component } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterOutlet, RouterLink, RouterLinkActive, ActivatedRoute } from '@angular/router';
import { ServiceActividad } from '../actividades';
@Component({
  selector: 'app-actividad-realizada',
  standalone: true,
  imports: [],
  templateUrl: './actividad-realizada.component.html',
  styleUrl: './actividad-realizada.component.css'
})
export class ActividadRealizadaComponent {

  idEquipo:any;
  equipo:any;
  ngOnInit(): void {
    this.obtenerActividades();
    this.informacionEquipo();
    
    

    

   
   
 }
 constructor(private route: ActivatedRoute,private serviceAxtividades:ServiceActividad){
 
  }

  obtenerActividades(){
  this.idEquipo = this.route.snapshot.paramMap.get('idEquipo');
  console.log(this.idEquipo)
  this.serviceAxtividades.getEquiposSede(this.idEquipo).subscribe((
    data:any)=>{
    console.log(data);
    this.idEquipo = data;
  }, (error:any) =>{ 
    console.log('El error es: '+error);
     })

 }

 informacionEquipo(){
  this.equipo = this.route.snapshot.paramMap.get('idEquipo');
  console.log(this.equipo)
  this.serviceAxtividades.getEquipo(this.idEquipo).subscribe((
    data:any)=>{
    console.log(data);
    this.equipo = data;
  }, (error:any) =>{ 
    console.log('El error es: '+error);
     })

 }

}
