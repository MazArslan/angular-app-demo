import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable } from 'rxjs';
import { Task } from 'src/app/Task';

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
  })
}

@Injectable({
  providedIn: 'root'
})

export class TaskService {
  private apiUrl = 'http://localhost:8000/api';
  constructor(private http:HttpClient) { }

  getTasks(): Observable<Task[]> {
    return this.http.get<Task[]>(this.apiUrl)
  }

  deleteTask(task: Task): Observable<Task> {
    const uri = `${this.apiUrl}/delete-task/${task.id}`;
    return this.http.delete<Task>(uri);
  }

  updateTaskReminder(task: Task): Observable<Task>{
    const url = `${this.apiUrl}/update-task/${task.id}`;
    return this.http.put<Task>(url, task, httpOptions)
  }

  addTask(task: Task): Observable<Task>{
    const url = `${this.apiUrl}/add-task`;
    return this.http.post<Task>(url, task, httpOptions);
  }

}