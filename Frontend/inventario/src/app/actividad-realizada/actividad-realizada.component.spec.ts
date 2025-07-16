import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ActividadRealizadaComponent } from './actividad-realizada.component';

describe('ActividadRealizadaComponent', () => {
  let component: ActividadRealizadaComponent;
  let fixture: ComponentFixture<ActividadRealizadaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ActividadRealizadaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ActividadRealizadaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
