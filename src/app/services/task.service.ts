import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable } from 'rxjs';
import { Task } from 'src/app/Task';
import { environment } from '../../environments/environment'

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
  })
}

@Injectable({
  providedIn: 'root'
})

export class TaskService {
  private apiUrl = environment.apiUrl;

  constructor(private http:HttpClient) { }

  getTasks(): Observable<Task[]> {
    console.log("getting all tasks");
    console.log(this.apiUrl);
    return this.http.get<Task[]>(this.apiUrl)
  }

  deleteTask(task: Task): Observable<Task> {
    const uri = `${this.apiUrl}/delete-task/${task.id}`;
    return this.http.delete<Task>(uri);
  }

  updateTaskReminder(task: Task): Observable<Task>{
    const url = `${this.apiUrl}/update-task/${task.id}`;
    console.log("updating task " + task)
    return this.http.put<Task>(url, task, httpOptions)
  }

  addTask(task: Task): Observable<Task>{
    const url = `${this.apiUrl}/add-task`;
    console.log("adding task " + task)
    return this.http.post<Task>(url, task, httpOptions);
  }

}
