import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VistaSedeComponent } from './vista-sede.component';

describe('VistaSedeComponent', () => {
  let component: VistaSedeComponent;
  let fixture: ComponentFixture<VistaSedeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VistaSedeComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VistaSedeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
