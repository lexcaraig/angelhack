import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'angelhack-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent implements OnInit {
  @Input('columns') columns;
  @Input('source') source;

  @Output('onView') onView: EventEmitter<any> = new EventEmitter<any>();

  constructor() { }

  ngOnInit() {
  }

  view(details) {
    this.onView.emit(details);
  }

}
