import { Routes } from '@angular/router';
import { VistaSedeComponent } from './vista-sede/vista-sede.component';
import { AppComponent } from './app.component';
import { SedesComponent } from './sedes/sedes.component';

export const routes: Routes = [
    {path:"",component:SedesComponent},
    {
        
         path:"sede/:idsede",component:VistaSedeComponent
    }
];
